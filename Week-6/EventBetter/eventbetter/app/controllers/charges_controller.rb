class ChargesController < ApplicationController

  @@event=Event.new

  def new
    @event = Event.find(params[:mon_cul])
    @@event = @event
  end

  def create
    # Amount in cents
    @amount = @@event.price

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })

      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'eur',
        })

      att = Attendance.create(user: current_user, event: @@event)

        redirect_to event_path(id: @@event.id)

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
      end

    end
