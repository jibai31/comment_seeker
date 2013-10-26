class CommentSearch

  attr_reader :pattern

  def initialize
    patterns = [
      "Ecrire un commentaire",
      "Laisser un commentaire",
      "Publier un commentaire",
      "Envoyer un commentaire",
      "Ajouter un commentaire",
      "Postez le commentaire",
      "Réagir",
      "Je commente",
      "Vos réactions",
      "Commentez cet article",
      "Se connecter et publier",
      "Réagir à cet article",
      "Laisser une réponse",
      "Leave a reply",
      "Facebook comment",
      "Post comment"
    ]
    @pattern = Regexp.new(Regexp.union(patterns).source, Regexp::IGNORECASE)
  end
end
