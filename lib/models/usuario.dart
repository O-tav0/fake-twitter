class Usuario {
  String nome;
  String nomeUsuario;
  String email;
  String senha;
  String dataNascimento;
  String pais;
  String uid;

  Usuario(this.nome, this.nomeUsuario, this.email, this.senha, this.dataNascimento, this.pais, this.uid);

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'nomeUsuario': nomeUsuario,
        'email': email,
        'senha': senha,
        'dataNascimento': dataNascimento,
        'pais': pais,
        'uid': uid
      };
}