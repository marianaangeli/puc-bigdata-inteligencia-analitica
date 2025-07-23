# Sistema de Financiamentos Imobiliários

Sistema Java para gerenciamento de financiamentos de imóveis desenvolvido aplicando conceitos de Programação Orientada a Objetos (POO).

## 📋 Descrição

Este projeto implementa um sistema completo para calcular e gerenciar financiamentos de diferentes tipos de imóveis (casas, apartamentos e terrenos), demonstrando conceitos fundamentais de POO como herança, polimorfismo, encapsulamento e abstração.

## 🏗️ Arquitetura do Sistema

### Estrutura de Classes:
```
Financiamento (Abstract)
    ├── Casa
    ├── Apartamento  
    └── Terreno

InterfaceUsuario (Utility)
Main (Principal)
AumentoMaiorDoQueJurosException (Custom Exception)
```

## 🚀 Funcionalidades

### Tipos de Financiamento:
- **🏠 Casa**: Inclui seguro mensal fixo de R$ 80,00 + área construída e do terreno
- **🏢 Apartamento**: Cadastro com número de quartos e garagens
- **🌿 Terreno**: Financiamento simples baseado apenas na área total

### Operações Disponíveis:
- ✅ **Cadastrar** diferentes tipos de imóveis
- 📋 **Listar** todos os financiamentos com prestações calculadas
- 💾 **Salvar** dados em arquivo serializado (.ser)
- 📄 **Exportar** relatório em arquivo texto (.txt)
- 📖 **Ler** dados salvos

## 🛠️ Tecnologias e Conceitos

### Java Features:
- **JDK 17+** com recursos modernos (switch expressions)
- **Serialização** de objetos
- **Manipulação de arquivos** (I/O)
- **Tratamento de exceções**

### Conceitos de POO Aplicados:
- **Herança**: Classes filhas estendem `Financiamento`
- **Polimorfismo**: Método `calcularPrestacao()` implementado diferentemente
- **Encapsulamento**: Atributos privados com getters
- **Abstração**: Classe abstrata `Financiamento`
- **Serialização**: Implementa `Serializable`

## 📁 Estrutura do Projeto

```
programacao-orientada-a-objetos/
├── sistema-financiamentos/
│   ├── Financiamento.java           # Classe abstrata base
│   ├── Casa.java                    # Herda de Financiamento
│   ├── Apartamento.java             # Herda de Financiamento  
│   ├── Terreno.java                 # Herda de Financiamento
│   ├── InterfaceUsuario.java        # Menu e interação
│   ├── Main.java                    # Classe principal
│   ├── AumentoMaiorDoQueJurosException.java # Exceção customizada
│   └── README.md                    # Esta documentação
```

## 🔧 Como Executar

### 1. **Compilar o projeto:**
```bash
javac *.java
```

### 2. **Executar o sistema:**
```bash
java Main
```

### 3. **Usar o sistema:**
```
--- MENU ---
1 - Cadastrar Casa
2 - Cadastrar Apartamento  
3 - Cadastrar Terreno
4 - Listar financiamentos
0 - Sair e salvar
```

## 💡 Exemplos de Uso

### Cadastro de Casa:
```
Valor do imóvel: 300000
Prazo (anos): 20
Taxa de juros (%): 8.5
Área construída: 120
Área do terreno: 250
```

### Cálculo da Prestação:
- **Casa**: `(Valor × (1 + juros%)) / (anos × 12) + R$ 80,00`
- **Apartamento**: `(Valor × (1 + juros%)) / (anos × 12)`  
- **Terreno**: `(Valor × (1 + juros%)) / (anos × 12)`

## 📊 Recursos Técnicos

### Persistência de Dados:
- **Serialização**: Salva objetos em `financiamentos.ser`
- **Arquivo Texto**: Export em `financiamentos.txt` para relatórios

### Tratamento de Erros:
- Validação de entrada com `InputMismatchException`
- Exceção customizada para regras de negócio
- Tratamento de erros de I/O

### Padrões Aplicados:
- **Template Method**: Classe abstrata define estrutura
- **Utility Class**: `InterfaceUsuario` para operações de menu
- **Data Access**: Métodos de leitura/escrita de arquivos

## 🎯 Conceitos Demonstrados

### Herança e Polimorfismo:
```java
public abstract class Financiamento {
    public abstract double calcularPrestacao(); // Implementado diferentemente
}

public class Casa extends Financiamento {
    @Override
    public double calcularPrestacao() {
        return prestacaoBase + SEGURO_MENSAL; // Lógica específica
    }
}
```

### Encapsulamento:
```java
private double valorImovel;  // Atributo privado
public double getValorImovel() { return valorImovel; } // Acesso controlado
```

---

⭐ Este projeto demonstra aplicação prática dos pilares da POO em Java!
