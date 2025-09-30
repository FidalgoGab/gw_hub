# GWHub – Mobile

**Protótipo Funcional Mobile de automação e eficiência energética**

## Equipe

- Gabriel Fidalgo - RM563213
- Pedro Lima - RM565461
- Luiggi Peotta - RM563607
- Gustavo Maia - RM562240
- Gustavo Rossi - RM566075

---

## Arquitetura Mobile

A aplicação foi desenvolvida em **Dart + Flutter**, integrando APIs externas e utilizando recursos nativos para Notificações e conexão com Firebase.

### Principais Tecnologias

- **Dart** – linguagem principal.
- **Flutter** – framework utilizado para gerar Apps multiplataforma.
- **Firebase** – possibilita o uso de diversos recursos, como Autenticação, Notificações etc.

---

## Resultados e Dados Funcionais

- **Integração com API** nos dá a possibilidade de consumir diversos recursos.
- **Interface amigável** e intuitiva faz com que qualquer pessoa use nosso sistema.

---

## Justificativas Técnicas

- **Flutter** possibilita o desenvolvimento para duas ou mais plataformas com uma base de código.
- **Firebase** contempla diversos recursos que são fáceis de integrar.

---

## Estrutura de Pastas e Arquivos

```
gw_hub/
├── android/                    # Projeto nativo Android
├── ios/                        # Projeto nativo iOS
├── lib/                        # Código principal Flutter/Dart
│   ├── main.dart               # Ponto de entrada do app
│   ├── firebase_options.dart   # Configuração do Firebase
│   ├── screens/                # Telas da aplicação
│   ├── ui/                     # Configurações de interface e componentes
│   ├── models/                 # Classes reutilizáveis
│   ├── api/                    # Integração com APIs
│   └── ...                     # Outros arquivos e pastas
├── pubspec.yaml                # Dependências do projeto
├── README.md                   # Documentação
└── ...                         # Outros arquivos de configuração
```

---

## Como Rodar o Projeto

1. **Pré-requisitos**:

   - [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado na versão 3.35.3 (stable)
   - [Dart](https://dart.dev/get-dart) instalado
   - Emulador Android/iOS ou dispositivo físico

2. **Instale as dependências**:

   ```bash
   flutter pub get
   ```

3. **Execute o app**:

   ```bash
   flutter run
   ```

4. **Para rodar em um dispositivo específico**:
   ```bash
   flutter devices         # Lista dispositivos disponíveis
   flutter run -d <device_id>
   ```

---
