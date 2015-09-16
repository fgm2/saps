class Course < ActiveRecord::Base
    
    belongs_to :matter
    belongs_to :teacher
    # validates_uniqueness_of :matter, :teacher, :message => "Você já cadastrou esssa aula!"
  
  RailsAdmin.config do |config|
        config.model "Course" do
            label "Aula Oferecida"
            label_plural "Aulas Oferecidas"
            
            configure :name do
              label 'Nome'
            end
            configure :matter do
              label 'Matéria'
            end
            configure :teacher do
                label 'Professor'
            end
            configure :description do
                label 'Descrição'
            end
            configure :value do
                label 'R$ por Hora'
            end
            configure :evaluation do
                label 'Curso Avaliado'
            end
            configure :created_at do
                label 'Criado em'
            end
            configure :updated_at do
                label 'Atualizado em'
            end
            list do
              field :id
              field :name
              field :matter
              field :teacher
              field :description
              field :value
              field :evaluation
              field :created_at
              field :updated_at
            end
            edit do
              field :name
              field :matter
              field :teacher
              field :description
              field :value
            end
        end
    end
end
