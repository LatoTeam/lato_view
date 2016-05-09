module LatoCore
  class Superuser < ActiveRecord::Base

    # Lista validazioni
    validates :name,  presence: true, length: { maximum: 50 }
    validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
    validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
    validates :permission, presence: true, length: { minimum: 1, maximum: 10 }
    validates :password, presence: true, length: { minimum: 6, maximum: 50 }, on: :create
    has_secure_password

    # Azioni prima del salvataggio
    before_save {
      self.username = username.downcase
      self.email = email.downcase

      setAdminPermission()
    }


    # Funzione che imposta i permessi dell'utente amministratore al massimo livello
    private def setAdminPermission
      first_user = LatoCore::Superuser.first
      if(first_user and self.id === first_user.id)
        self.permission = 10
      end
    end

  end
end
