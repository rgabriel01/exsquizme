class QuestionsIndex < Chewy::Index
  define_type Question do
    field :description
    field :answer
  end
end