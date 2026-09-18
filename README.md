# Stickman AI & Fitness Design System

## Sobre o Projeto
Aplicação móvel desenvolvida como requisito prático para a disciplina de **Mobile II** (Licenciatura em Engenharia de Software, Centro Universitário Católica do Tocantins - UniCatólica). O foco do projeto é a criação de um sistema de design modular e a implementação de uma interface interativa baseada em gestos.

## Padrões Arquiteturais e Técnicos
O projeto foi estruturado seguindo rigorosamente os seguintes conceitos:
* **Arquitetura de Componentes:** Separação lógica utilizando o padrão `Componente` (Widget), `ViewModel` (Dados/Estado) e `Factory` (Instanciação).
* **Design System Customizado:** Implementação de um UI Kit próprio independente dos componentes padrão do Material Design.
* **Interação e Canvas:** Utilização de `CustomPainter` e `GestureDetector` para capturar coordenadas de ecrã e renderizar traços dinâmicos simulando uma heurística de reconhecimento visual.

## Tecnologias
* Dart / Flutter
* Gestão de estado local (StatefulWidgets)

## Autor
* Marcus
