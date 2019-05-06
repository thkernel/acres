module PaymentDelaysHelper

    def actions_for_payment_delays
        begin
            payment_delay = PaymentDelay.all

            if payment_delay.present?
                link_to "Mettre à jour", edit_payment_delay_path(payment_delay.first.id), title: "Modifier", remote: true 

            else
                link_to "Paramétrer", new_payment_delay_path, title: "Paramétrer", remote: true 

            end
        rescue Exception => e
            puts "Erreur: #{e.message}"
        end
    end
end
