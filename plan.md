# 10.000-uur AI/LLM Engineer Training Plan

**TL;DR**: Een 5-niveau curriculum (2-3 jaar, 20-30 uur/week) dat volledige beginners voorbereidt op production-grade AI/LLM engineering. Bouwt progressief: Python fundamentals → Wiskunde & Data Science → Machine Learning → Deep Learning → LLM Specialization (training + production). Elk niveau culmineert in capstone projects. Balans: 35% theorie, 65% hands-on code. Tech stack: Python + PyTorch + Hugging Face. Geschikt voor self-paced en groepsleren.

---

## NIVEAU-STRUCTUUR (5 niveaus)

| Niveau | Uren | Weken (20h/wk) | Focus | Technologie |
|--------|------|----------------|-------|-------------|
| **1: Foundations** | 2.000 | 100 | Python, Wiskunde, Basale Data Science | Python, NumPy, Pandas, Matplotlib |
| **2: Machine Learning** | 2.000 | 100 | ML Algorithms, Evaluation, Feature Engineering | scikit-learn, Jupyter |
| **3: Deep Learning Basics** | 2.000 | 100 | Neural Networks, CNN, RNN, Transformers Intro | PyTorch, TensorFlow |
| **4: Advanced DL & LLMs** | 2.000 | 100 | LLM Architectures, Fine-tuning, Production Ops | Hugging Face, LoRA, vLLM |
| **5: LLM Specialization** | 2.000 | 100 | Advanced LLMOps, Agents, RAG, Custom Systems | LangChain, MLflow, Docker |

**Totaal**: ~500 weken = ~9,6 jaar @ 20 uur/week (of 12 weken @ 166 uur/week intensief bootcamp-style)

---

## NIVEAU 1: FOUNDATIONS (2.000 uur)

**Doel**: Leerlingen kunnen self-contained Python scripts schrijven, basiswiskunde begrijpen, data manipuleren in DataFrames.

**Onderverdeling** (2.000 uur):
- Python Programmeren: 700 uur
- Wiskunde Fundamentals: 500 uur
- Data Science Tools: 600 uur
- Projects & Practicum: 200 uur

### 1.1 Python Programming (700 uur)

| Topic | Uren | Resources | Deliverables |
|-------|------|-----------|---|
| Variables, types, operators | 80 | Python Official Docs, Codecademy | 5 small scripts |
| Control flow (if/for/while) | 100 | Interactive coding exercises (Exercism, HackerRank) | Algorithms practice |
| Functions, scope, lambdas | 120 | Real Python, YouTube walkthroughs | Build a calculator library |
| Data structures (lists, dicts, sets) | 100 | Hands-on exercises | Data structure quiz app |
| File I/O, JSON, CSV | 80 | Building practical tools | CSV processor tool |
| Error handling & debugging | 100 | Writing defensive code | Robust CLI tool |
| OOP basics (classes, methods, inheritance) | 100 | Real Python OOP series | Simple class hierarchy |
| Modules, packages, imports | 40 | Building multi-file project | Personal library package |
| Virtual environments & pip | 40 | Poetry/venv practical setup | Project environment templates |
| **Testing basics** | 40 | pytest fundamentals | Write 20+ test cases |

**Capstone Project (1.1)**: Build a multi-module **File Organizer CLI** that:
- Reads directories recursively
- Classifies files by type
- Moves them to organized folders
- Logs all operations
- Has error handling & tests

---

### 1.2 Wiskunde Fundamentals (500 uur)

| Topic | Uren | Source | Practicum |
|-------|------|--------|----------|
| **Linear Algebra** | 200 | Khan Academy (Linear Algebra, 14 units) + 3Blue1Brown videos | Numpy matrix operations |
| - Vectors, matrices, operations | 60 | Interactive | Build vector library |
| - Eigenvalues, eigenvectors | 40 | Understand in code | NumPy demonstrations |
| - Matrix decomposition (SVD) | 50 | Visual intuition | Image compression with SVD |
| - Applications to ML | 50 | Connecting to ML | Feature transformation |
| **Calculus for ML** | 150 | Andrew Ng ML course + Mathematics for ML Coursera | Gradient calculations |
| - Derivatives, partial derivatives | 60 | | Implement gradient descent manually |
| - Chain rule and backpropagation intuition | 40 | | Numerical vs. analytical gradients |
| - Optimization (gradient descent) | 50 | | Optimize a loss function |
| **Probability & Statistics** | 150 | Khan Academy + StatQuest with Josh Starmer (YouTube) | Statistical analysis |
| - Probability distributions | 50 | Normal, Poisson, Bernoulli | Sampling & plotting |
| - Bayes' theorem | 40 | Intuitive explanation | Spam email classifier |
| - Hypothesis testing, A/B testing | 30 | T-tests, p-values | Statistical significance |
| - Descriptive statistics | 30 | Mean, variance, correlation | Real data analysis |

**Capstone Project (1.2)**: **Statistical Analysis Dashboard**:
- Load real dataset (Kaggle)
- Calculate descriptive stats
- Visualize distributions
- Conduct hypothesis testing
- Interpret results in report

---

### 1.3 Data Science Tools (600 uur)

| Topic | Uren | What You'll Build |
|-------|------|-------------------|
| **NumPy mastery** | 150 | - Array operations library<br>- Matrix multiplication engine<br>- Statistical functions |
| - Array creation and manipulation | 50 | Efficient data operations |
| - Vectorization (anti-loop) | 50 | Performance optimization |
| - Broadcasting & advanced indexing | 50 | Complex data transformations |
| **Pandas Data Manipulation** | 200 | - CSV/Excel data processor<br>- Missing data handler<br>- Data aggregation tool |
| - Series and DataFrames | 60 | Load and explore data |
| - Indexing, slicing, selecting | 50 | Navigate large datasets |
| - GroupBy, merging, reshaping | 50 | Complex transformations |
| - Missing data handling | 40 | Realistic data cleaning |
| **Visualization with Matplotlib & Seaborn** | 100 | - Publication-quality charts<br>- Interactive dashboards<br>- Multi-panel figures |
| - Line plots, histograms, scatter | 40 | Exploratory data analysis |
| - Subplots and styling | 30 | Professional visualizations |
| - Seaborn statistical graphics | 30 | Advanced statistical plots |
| **Jupyter Notebooks** | 100 | - Reproducible analyses<br>- Documentation best practices<br>- Notebook organization |
| - Literate programming | 50 | Narrative code |
| - Markdown + code integration | 30 | Documentation |
| - Sharing & version control | 20 | Collaboration |
| **SQL Basics (SQLite)** | 50 | - Local database setup<br>- Query complex data<br>- Schema design |

**Capstone Project (1.3)**: **Exploratory Data Analysis (EDA) on Real Dataset**:
- Load multi-table dataset (Kaggle)
- Clean and handle missing values
- Aggregate and summarize
- Create 15+ visualizations
- Generate insights report in Jupyter

---

### 1.4 Projects & Integration (200 uur)

- **Project 1 (100h)**: Build an **end-to-end data pipeline**
  - Scrape/download data from API or public source
  - Clean, validate, transform with Pandas
  - Store in SQLite
  - Create 10+ visualizations
  - Deploy on GitHub with README

- **Project 2 (100h)**: **Personal Data Analysis Portfolio**
  - Pick 3 datasets of personal interest
  - Conduct full EDA on each
  - Include hypothesis testing
  - Create publication-ready visualizations
  - Write Medium article explaining findings

---

**Milestone After Niveau 1**: Leerlingen kunnen Python scripts schrijven, data manipuleren, visualizaties maken, statistische analyse doen.

---

## NIVEAU 2: MACHINE LEARNING (2.000 uur)

**Doel**: Leerlingen kunnen ML algoritmes implementeren, modelo evalueren, productie-ready pipelines bouwen.

**Onderverdeling** (2.000 uur):
- ML Fundamentals & Algorithms: 800 uur
- Practical ML Engineering: 600 uur
- Advanced Topics: 400 uur
- Capstone Projects: 200 uur

### 2.1 ML Fundamentals & Algorithms (800 uur)

| Topic | Uren | Practicum |
|-------|------|----------|
| **ML Concepts** | 200 | |
| - Problem framing & metrics | 50 | House price prediction |
| - Train/test/validation splits | 50 | Cross-validation strategies |
| - Overfitting & regularization | 50 | Bias-variance tradeoff |
| - Feature engineering & selection | 50 | Feature importance analysis |
| **Supervised Learning - Regression** | 250 | |
| - Linear regression (mathematical + sklearn) | 80 | Predict stock prices |
| - Polynomial & regularized regression | 60 | Ridge/Lasso implementation |
| - Evaluation: MSE, RMSE, R-squared | 50 | Model comparison |
| - Residual analysis | 40 | Diagnostics and validation |
| - Advanced: Elastic Net, Huber regression | 20 | |
| **Supervised Learning - Classification** | 300 | |
| - Logistic regression | 70 | Binary classification baseline |
| - Decision Trees | 70 | Feature importance, pruning |
| - Ensemble Methods (Random Forest) | 60 | Combining weak learners |
| - Gradient Boosting (XGBoost) | 70 | State-of-the-art tabular data |
| - SVM (Support Vector Machines) | 40 | Kernel tricks |
| - Evaluation: Precision, Recall, F1, ROC-AUC | 50 | Class imbalance handling |
| **Unsupervised Learning** | 150 | |
| - K-means clustering | 50 | Customer segmentation |
| - Hierarchical clustering | 40 | Dendrogram analysis |
| - Dimensionality reduction: PCA | 40 | Visualization & speed |
| - DBSCAN and Gaussian Mixtures | 20 | Density-based clustering |
| **Anomaly Detection** | 50 | Outlier detection in datasets |

**Capstone Project (2.1)**: **Complete ML Classification Pipeline**
- Dataset: Predict churn / fraud / disease
- Build 5+ models (LR, DT, RF, XGB, SVM)
- Hyperparameter tuning with GridSearchCV
- Cross-validation and evaluation
- Feature importance analysis
- Model comparison and selection

---

### 2.2 Practical ML Engineering (600 uur)

| Topic | Uren | Tools | Output |
|-------|------|-------|--------|
| **Data Pipelines & Preprocessing** | 150 | scikit-learn Pipelines | Reproducible preprocessing |
| - Data cleaning at scale | 60 | Pandas, missing value strategies | Robust pipelines |
| - Feature scaling & normalization | 40 | StandardScaler, MinMaxScaler | Pipeline integration |
| - Categorical encoding | 50 | OneHotEncoder, target encoding | Production-ready encoding |
| **Hyperparameter Tuning** | 150 | GridSearchCV, RandomizedSearchCV, Optuna | Optimized models |
| - Grid search | 50 | Exhaustive parameter search | Best params discovery |
| - Random search | 50 | Efficient sampling | Performance comparison |
| - Bayesian optimization (Optuna) | 50 | Cutting-edge tuning | Faster convergence |
| **Model Evaluation & Debugging** | 150 | Confusion matrix, classification reports | Rigorous evaluation |
| - Metrics dashboards | 60 | Custom evaluation functions | Comprehensive reporting |
| - Learning curves (detect bias/variance) | 50 | Plotting overfitting signs | Diagnostic analysis |
| - Partial Dependence Plots (PDP) | 40 | Feature effects visualization | Model interpretability |
| **Model Deployment Basics** | 150 | Flask, joblib, Docker | Simple production setup |
| - Saving/loading models | 40 | joblib, pickle | Model persistence |
| - Building simple API | 50 | Flask endpoint | HTTP interface |
| - Docker containerization | 40 | ML model in container | Reproducible environment |
| - Testing ML code | 20 | Unit test ML functions | Tested models |

**Capstone Project (2.2)**: **Production ML Application**
- Build end-to-end ML system
- Preprocessing pipeline
- Model training & tuning
- Flask API with /predict endpoint
- Dockerized, documented
- Deploy to cloud (AWS/GCP)
- Monitor predictions

---

### 2.3 Advanced ML Topics (400 uur)

| Topic | Uren | Advanced Concept |
|-------|------|-------------------|
| **Imbalanced Datasets** | 100 | SMOTE, class weights, sampling strategies |
| **Ensemble Methods Deep Dive** | 100 | Stacking, blending, voting classifiers |
| **Time Series Forecasting** | 100 | ARIMA, Exponential Smoothing, Prophet |
| **Recommendation Systems** | 100 | Collaborative filtering, Matrix Factorization |

---

### 2.4 Capstone Projects (200 uur)

- **Project 1 (100h)**: **Kaggle Competition**
  - Compete in active Kaggle competition
  - Feature engineering
  - Ensemble of models
  - Achieve top 10% score goal

- **Project 2 (100h)**: **Portfolio Project: Real Business Problem**
  - Pick a real-world dataset/problem
  - Build end-to-end ML pipeline
  - Deploy and document
  - Write case study blog post

---

**Milestone After Niveau 2**: Leerlingen kunnen complete ML pipelines bouwen, tunen, evalueren, en produceren.

---

## NIVEAU 3: DEEP LEARNING BASICS (2.000 uur)

**Doel**: Leerlingen begrijpen neural networks diep, kunnen transformers gebruiken, hebben basis kennis van LLM architectuur.

**Onderverdeling**:
- Neural Networks Fundamentals: 600 uur
- Convolutional & Recurrent Networks: 500 uur
- Transformers & Attention: 500 uur
- Projects: 400 uur

### 3.1 Neural Networks Fundamentals (600 uur)

| Topic | Uren | Framework | Project |
|-------|------|-----------|---------|
| **From Linear to Neural** | 100 | PyTorch | |
| - Perceptron to MLP | 50 | Implement from scratch | Classification on MNIST |
| - Backpropagation (derivation) | 50 | Manual computation | Verify gradients |
| **PyTorch Fundamentals** | 150 | PyTorch | |
| - Tensors and operations | 50 | Creating/manipulating tensors | Image processing |
| - Autograd (automatic differentiation) | 60 | Compute gradients | Neural net training |
| - Building custom modules | 40 | nn.Module best practices | Custom layers |
| **Training Neural Networks** | 200 | PyTorch & best practices | |
| - Loss functions (CE, MSE, etc.) | 50 | Choosing losses | Multi-task losses |
| - Optimizers (SGD, Adam, etc.) | 50 | Optimization algorithms | Hyperparameter effects |
| - Batch normalization & layer norm | 50 | Stabilizing training | Training speed comparison |
| - Callbacks & early stopping | 40 | Training monitoring | Prevent overfitting |
| - Learning rate scheduling | 10 | Adaptive learning rates | Better convergence |
| **Regularization Techniques** | 100 | Reducing overfitting | |
| - Dropout | 40 | Random deactivation | Ensemble effect |
| - L1/L2 regularization | 30 | Weight penalties | Complexity control |
| - Data augmentation basics | 30 | Input variation | Robustness increase |
| **Debugging Deep Learning** | 50 | Practical debugging | |
| - Gradient checking | 25 | Verify gradients | Catch implementation bugs |
| - Activation visualization | 25 | Understanding hidden states | Model interpretability |

**Capstone Project (3.1)**: **MNIST Classification from Scratch**
- Build MLP from pure PyTorch
- No high-level libraries
- Achieve 97%+ accuracy
- Visualize learned features
- Experiment with architectures

---

### 3.2 Convolutional & Recurrent Networks (500 uur)

| Topic | Uren | Application |
|-------|------|-------------|
| **Convolutional Neural Networks (CNNs)** | 250 | |
| - Convolution operation (intuition + math) | 50 | Implement Conv2d from scratch |
| - Common architectures (LeNet, VGG, ResNet) | 100 | Train on CIFAR-10 |
| - Transfer learning with pretrained models | 80 | Fine-tune ImageNet models |
| - Object detection intro (YOLO basics) | 20 | Detection pipeline |
| **Recurrent Neural Networks** | 150 | |
| - RNN, LSTM, GRU from scratch | 70 | Text generation character-level |
| - Sequence-to-sequence | 40 | Machine translation intro |
| - Attention mechanism intro | 40 | Why attention matters |
| **Practical Computer Vision** | 100 | |
| - Image classification pipeline | 50 | End-to-end vision project |
| - Data augmentation for images | 30 | Improve robustness |
| - Working with large image datasets | 20 | Memory-efficient training |

**Capstone Project (3.2)**: **Image Classification with Transfer Learning**
- Dataset: CIFAR-100 or custom (10k+ images)
- Load pretrained ResNet50
- Fine-tune for custom classes
- Data augmentation
- Achieve 85%+ accuracy
- Deploy as web service

---

### 3.3 Transformers & Attention Mechanism (500 uur)

| Topic | Uren | Depth |
|-------|------|-------|
| **Attention is All You Need** | 150 | |
| - Self-attention mechanism | 60 | Implementation & intuition |
| - Multi-head attention | 40 | Multiple representation spaces |
| - Positional encoding | 30 | Sequence position tracking |
| - Transformer architecture | 20 | Full architecture assembly |
| **Pre-trained Transformer Models** | 200 | Hugging Face |
| - BERT, GPT, T5 architecture | 80 | Language models comparison |
| - Tokenization strategies | 40 | Byte-pair encoding, subword |
| - Loading & using Hugging Face models | 40 | Free-tier GPU inference |
| - Fine-tuning transformers | 40 | Task-specific adaptation |
| **Text Application & NLP Basics** | 150 | |
| - Text classification with transformers | 60 | Sentiment analysis, toxicity |
| - Token classification (NER, POS) | 60 | Named entity recognition |
| - Text generation | 30 | Prompt-based generation |

**Capstone Project (3.3)**: **Fine-tune Transformer for NLP Task**
- Task: Sentiment analysis, NER, or Q&A
- Load pretrained BERT or DistilBERT
- Fine-tune on custom dataset
- Evaluation & interpretation
- Gradual knowledge integration
- Deploy API

---

### 3.4 Deep Learning Projects (400 uur)

- **Project 1 (150h)**: **End-to-End Vision Project**
  - Custom image dataset collection
  - Preprocessing & augmentation
  - Model selection & training
  - Optimization & tuning
  - Deploy with Flask/FastAPI

- **Project 2 (150h)**: **End-to-End NLP Project**
  - Fine-tune transformer
  - Evaluation metrics specific to task
  - Error analysis
  - Deploy inference API
  - A/B testing setup

- **Project 3 (100h)**: **Kaggle Deep Learning Competition**
  - Participate in active competition
  - Compete with DL models
  - Achieve competitive score

---

**Milestone After Niveau 3**: Leerlingen begrijpen neural networks diep, kunnen transformers gebruiken, klaar voor LLM training.

---

## NIVEAU 4: ADVANCED DL & LLMs (2.000 uur)

**Doel**: Leerlingen kunnen LLMs fine-tunen, begrijpen production considerations, optimaliseren voor inferentie.

**Onderverdeling**:
- LLM Architecture & Theory: 600 uur
- Fine-tuning Methodologies: 600 uur
- Production LLM Systems: 500 uur
- Projects: 300 uur

### 4.1 LLM Architecture & Theory (600 uur)

| Topic | Uren | Deep Dive |
|-------|------|----------|
| **Transformer Internals** | 200 | |
| - Detailed attention math | 60 | Implement multi-head attention in PyTorch |
| - Positional encodings (learned, rotary, ALiBi) | 40 | Efficient position representations |
| - Normalization variants (LayerNorm, RMSNorm) | 40 | Numerical stability |
| - Activation functions (gelu, swiglu) | 30 | Why they matter |
| - Full transformer decoder block | 30 | Putting it together |
| **Common LLM Architectures** | 250 | |
| - GPT family (GPT-2, GPT-3 scaling laws) | 80 | Decoder-only language modeling |
| - LLaMA (Meta) - efficient architecture | 60 | Modern open-source approach |
| - Mistral, Phi - smaller efficient LLMs | 40 | Distillation and efficiency |
| - Vision Transformers and Multimodal | 40 | CLIP, LayoutLM variants |
| - Instruction-tuned models (ChatGPT-like) | 30 | RLHF and alignment |
| **Language Modeling Fundamentals** | 150 | |
| - Next-token prediction | 50 | Core training objective |
| - Context windows & sliding windows | 50 | Sequence length considerations |
| - Evaluation: Perplexity & cross-entropy | 50 | Model quality metrics |

**Capstone Project (4.1)**: **Build a Small Language Model from Scratch**
- Implement GPT-like decoder transformer
- Train on Shakespeare or code dataset (1B tokens)
- Achieve reasonable perplexity
- Analyze attention patterns
- Understand scaling laws

---

### 4.2 Fine-tuning Methodologies (600 uur)

| Topic | Uren | Technique | When to Use |
|-------|------|-----------|-------------|
| **Full Model Fine-tuning** | 150 | Update all weights | Unlimited compute |
| - End-to-end training | 60 | Full backprop | Custom domains |
| - Multi-GPU training (DDP) | 60 | Distributed training | Large models |
| - Gradient accumulation | 30 | Effective batch size | Limited VRAM |
| **Parameter-Efficient Fine-tuning** | 200 | Freeze most weights | Limited resources |
| - LoRA (Low Rank Adaptation) | 80 | Inject learnable rank-r matrices | Most popular |
| - QLoRA | 60 | Quantized + LoRA | 1 GPU fine-tuning |
| - Prefix/Prompt Tuning | 40 | Soft prompt learning | Domain adaptation |
| - DoRA, AdaLoRA | 20 | Recent improvements | Better quality |
| **Instruction & Preference Tuning** | 150 | Alignment to human preferences | Chat/instruction models |
| - Supervised instruction tuning (SFT) | 50 | Fine-tune on Q&A pairs | Quick task adaptation |
| - Reinforcement Learning from Human Feedback (RLHF) | 60 | PPO training | Alignment (advanced) |
| - DPO (Direct Preference Optimization) | 40 | Simpler alignment without RLHF | New best practice |
| **Advanced Techniques** | 100 | Cutting-edge methods | Research-grade |
| - Mixed Precision Training | 30 | FP16/BF16 efficiency | Speed & memory |
| - Flash Attention & FlashDecoding | 30 | Kernel fusion | 2-4x speedup |
| - Distributed fine-tuning (multi-machine) | 40 | Scaling across clusters | Enterprise scale |

**Capstone Project (4.2)**: **Fine-tune Production LLM (Multiple Techniques)**
- Start with Llama 2 or Mistral 7B
- Prepare dataset (domain-specific or instruction)
- Implement & compare:
  - Full fine-tuning
  - LoRA fine-tuning
  - QLoRA on consumer GPU
- Measure quality vs. compute tradeoff
- Deploy best version

---

### 4.3 Production LLM Systems (500 uur)

| Topic | Uren | Component | Tools |
|-------|------|-----------|-------|
| **Inference Optimization** | 200 | Speed up inference | |
| - KV-cache optimization | 50 | Reuse computed values | 10x speedup |
| - Quantization techniques | 80 | int8, int4, GPTQ | 4-8x smaller |
| - Speculative decoding | 40 | Similar token prediction | 2-3x faster |
| - Batching & vLLM | 30 | Request batching | Throughput |
| **Deployment & Serving** | 200 | Running at scale | |
| - Model serving (vLLM, TGI, OLlama) | 60 | Production servers | Multiple models |
| - API design (streaming, async) | 60 | HTTP/WebSocket protocols | Real-time interaction |
| - Monitoring & logging | 50 | Track quality & performance | Production observability |
| - Cost optimization | 30 | GPU utilization, batch size tuning | $$$ savings |
| **RAG Systems** | 100 | Retrieval-Augmented Generation | |
| - Vector databases (Pinecone, Weaviate) | 40 | Semantic search | Knowledge base |
| - Embedding models | 30 | Generate vectors | Retrieval quality |
| - RAG pipe implementations | 30 | Retrieve + Generate | Knowledge grounding |

**Capstone Project (4.3)**: **Production LLM Application**
- Deploy fine-tuned LLM to production
- Set up vLLM or similar server
- FastAPI endpoint with streaming
- Implement basic RAG pipeline
- Monitor performance metrics
- Cost analysis & optimization

---

### 4.4 Advanced DL & LLM Projects (300 uur)

- **Project 1 (150h)**: **Full LLM Fine-tuning Pipeline**
  - Data collection & preparation
  - Training setup (distributed or LoRA)
  - Evaluation & benchmarking
  - Deployment infrastructure
  - Documentation & iteration

- **Project 2 (150h)**: **LLM-powered Application**
  - RAG system for specific domain
  - Or multi-agent orchestration
  - Or specialized chatbot
  - Production-grade deployment
  - User interface (web/CLI)

---

**Milestone After Niveau 4**: Leerlingen kunnen LLMs in production draaien, fine-tunen, optimaliseren.

---

## NIVEAU 5: LLM SPECIALIZATION (2.000 uur)

**Doel**: Leerlingen worden LLM engineers die systems ontwerpen, agents bouwen, research volgen, bedrijfswaarde creëren.

**Onderverdeling**:
- Advanced LLMOps & Production Systems: 600 uur
- Agents & Agentic AI: 500 uur
- Advanced RAG & Knowledge Systems: 400 uur
- Capstone & Specialization: 500 uur

### 5.1 Advanced LLMOps & Production Systems (600 uur)

| Topic | Uren | Enterprise Skill |
|-------|------|-----------------|
| **Model Management** | 200 | |
| - Model versioning & MLflow | 60 | Track experiments & models |
| - A/B testing LLM versions | 80 | Compare quality, cost, speed |
| - Monitoring & alerting | 60 | Detect degradation, bias |
| **Scaling & Infrastructure** | 200 | |
| - Kubernetes for ML | 80 | Orchestrate LLM services |
| - GPU cluster management | 60 | Multi-GPU, multi-machine |
| - Caching & CDN for inference | 40 | Reduce latency globally |
| - Load balancing & autoscaling | 20 | Handle traffic spikes |
| **Evaluation at Scale** | 150 | |
| - Automated evaluation metrics | 60 | BLEU, ROUGE, LLM-based evals |
| - Red-teaming & safety testing | 60 | Find failure modes |
| - Human-in-the-loop evaluation | 30 | Quality assurance |
| **Cost Analysis & Optimization** | 50 | |
| - Token economics | 25 | Per-model cost analysis |
| - Throughput optimization | 25 | Cost per output token |

### 5.2 Agents & Agentic AI (500 uur)

| Topic | Uren | Framework | Skill |
|-------|------|-----------|-------|
| **Agent Foundations** | 150 | | |
| - Agent loops & decision making | 50 | Plan → Execute → Observe | Agentic reasoning |
| - Tool use & function calling | 50 | APIs as agent tools | API integration |
| - Prompt engineering for agents | 50 | CoT, ReAct prompting | Instruction precision |
| **Multi-step Reasoning** | 150 | | |
| - Chain-of-Thought (CoT) reasoning | 50 | Step-by-step planning | Better problem solving |
| - Tree-of-Thought (ToT) | 50 | Explore multiple paths | Complex decision trees |
| - Reasoning loops | 50 | Iterate to better answers | Self-improvement |
| **Agent Frameworks & Tools** | 150 | | |
| - LangChain advanced patterns | 60 | Build agent logic flows | Production agents |
| - LlamaIndex indexing | 40 | Structured data integration | Knowledge graphs |
| - Autogen (multi-agent systems) | 50 | Agent collaboration | Cooperative AI |
| **Specialized Applications** | 50 | | |
| - Code generation agents | 25 | Write code autonomously | Developer assistants |
| - Data analysis agents | 25 | Query & analysis workflows | Data insights |

**Capstone Project (5.2)**: **Multi-Agent System**
- Build agents for different roles (researcher, analyst, executor)
- Implement communication protocol
- Solve complex multi-step problems
- Evaluate agent collaboration quality

### 5.3 Advanced RAG & Knowledge Systems (400 uur)

| Topic | Uren | State-of-the-Art |
|-------|------|-----------------|
| **Vector Stores & Embeddings** | 150 | |
| - Advanced embeddings (multilingual, domain-specific) | 50 | Specialized models |
| - Hybrid search (BM25 + semantic) | 50 | Better relevance |
| - Vector store benchmarking | 50 | Pgvector, Pinecone, Weaviate comparison |
| **RAG Architectures** | 150 | |
| - Dense retrieval vs. sparse | 50 | Trade-offs analysis |
| - Reranking & filtering | 50 | Improve precision |
| - Iterative RAG & refinement | 50 | Multi-hop questions |
| **Knowledge Processing** | 100 | |
| - Document chunking strategies | 50 | Semantic vs. fixed chunks |
| - Schema learning | 50 | Structured knowledge extraction |

### 5.4 Capstone & Specialization (500 uur)

Leerlingen kiezen één specialisatie en voeren zo'n groot project uit.

**Specialization Options:**

#### Option 1: LLM Research Track (500h)
- Read 20+ recent research papers (attention, scaling, alignment)
- Reproduce one paper's findings
- Propose & implement novel improvement
- Publish findings (e.g., ArXiv pre-print)

#### Option 2: LLMOps / DevOps Track (500h)
- Build production-grade LLM platform
- Multi-model serving with inference optimization
- Comprehensive monitoring & logging
- Cost reporting & optimization
- Infrastructure as Code (Terraform)
- Kubernetes deployment

#### Option 3: Domain-Specific Application Track (500h)
- Pick a domain: healthcare, law, finance, education
- Build end-to-end LLM application
- Integrate domain-specific data via RAG
- Fine-tune model for domain
- Evaluate on domain benchmarks
- Deploy to production
- Case study & documentation

#### Option 4: Agents & Automation Track (500h)
- Build sophisticated multi-agent system
- Solve real business problems autonomously
- Implement feedback loops for improvement
- Deploy for external users
- Analyze effectiveness & failure modes

---

**Final Capstone Project (all specializations):**
- Professional-grade project (portfolio-worthy)
- Code on GitHub with excellent documentation
- Technical blog post or paper
- Potential to present at conference/meetup
- Demonstrates deep expertise

---

## VERIFICATION & ASSESSMENT STRATEGY

### Per-Niveau Milestones:

| Niveau | Key Assessment | Graduation Criteria |
|--------|-----------------|-------------------|
| 1: Foundations | Python scripting + EDA project | Can write robust Python, manipulate data, make visualizations |
| 2: Machine Learning | Complete ML pipeline on Kaggle dataset | Can build, tune, evaluate ML models; understand trade-offs |
| 3: Deep Learning | Fine-tune transformer + deploy | Can train neural networks; understand LLM architectures |
| 4: Advanced DL & LLMs | Fine-tuned LLM in production | Can optimize, deploy, serve LLMs efficiently |
| 5: LLM Specialization | Capstone project + specialization | Expert in chosen area; can solve novel problems independently |

### Verification Methods:

- **Code Reviews**: All projects reviewed for quality, testing, documentation
- **Automated Testing**: Unit tests, integration tests required for all projects
- **Portfolio Review**: Evaluate GitHub portfolio quality
- **Benchmark Performance**: Achieve minimum benchmarks on standard datasets
- **Presentation**: Defend capstone projects to mentors/peers

---

## KEY DECISIONS MADE

### Why 5 levels?
Standard bootcamp (4 levels) doesn't prepare full specialists; added specialization tier for depth.

### Why 2.000 hours per level?
Balances depth with breadth; ~100 hours per major topic allows mastery.

### Why Blended format?
Offers structure + flexibility for different paces and availability.

### Why topic ordering?
Python → Math → Data Science → ML → DL → LLMs creates logical foundational progression.

### Why PyTorch + Hugging Face?
Industry standard for LLM research/prod; covers 90% of jobs.

### Why projects-heavy?
Learning-by-doing > tutorials; portfolio proof of skills.

### Why 35% theory / 65% hands-on?
Research shows practical ratio optimal for retention & job readiness.

---

## IMPLEMENTATION NOTES

### For Self-Paced Learning (20 hrs/week):
- Expect ~500 weeks total (~9.6 years)
- Each week: 12h lectures + tutorials, 8h hands-on coding
- Monthly milestones per topic to track progress
- Community support (Discord/forums) essential

### For Bootcamp Format (166 hrs/week):
- Compress to 12 weeks intensive
- Same curriculum, higher intensity
- Daily stand-ups and code reviews
- Pair programming encouraged
- Job placement support built-in

### For Blended Learning (variable pacing):
- Recommended: 20-30 hrs/week, 2-3 year timeline
- Milestones every 4-6 weeks
- Monthly 1-on-1 mentoring sessions
- Peer group accountability

---

## TECHNOLOGY STACK RECOMMENDATIONS

### Required:
- **Python 3.11+**: Core language
- **PyTorch 2.0+**: Deep learning framework
- **Hugging Face**: Transformers, datasets, hub
- **NumPy, Pandas**: Data manipulation
- **Jupyter**: Interactive notebooks
- **Git/GitHub**: Version control

### Strongly Recommended:
- **FastAPI**: Production APIs
- **LangChain**: Agent/RAG frameworks
- **vLLM**: LLM serving
- **Pydantic**: Data validation
- **MLflow**: Experiment tracking
- **Docker**: Containerization
- **Optuna**: Hyperparameter tuning
- **scikit-learn**: Classical ML reference

### Optional (specialized):
- **TensorFlow**: Alternative DL framework (TensorFlow Lite for mobile)
- **JAX**: Research-grade numerical computing
- **Polars**: High-performance dataframes
- **DuckDB**: Embedded analytics
- **Ray**: Distributed computing
- **Kubernetes**: Production orchestration
- **Databricks**: Enterprise data platform

---

## RESOURCE ESTIMATE

### For 10.000-hour program with 20 people:

**Hardware:**
- GPU cluster: 8× A100 80GB GPUs (~$30k-40k or cloud equivalent)
- CPU servers: 10× 32-core machines for non-GPU tasks
- Storage: 10TB fast NVMe, 100TB archival
- Network: 100Mbps minimum per person

**Software (licenses/platforms):**
- Cloud credits (AWS/GCP/Azure): ~$100k for full lifecycle
- Jupyter Hub enterprise: $2k-5k/year
- GitHub Organizations: $21/user/month
- Monitoring tools (Datadog, etc.): $500-1k/month
- LLM inference credits (if using APIs): ~$50k-100k

**Personnel:**
- Lead instructors: 2-3 (covering Python, ML, DL/LLMs)
- Teaching assistants: 4-5
- Dedicated mentor/career support: 1
- Total FTE: ~7-10 people

**Total Cost (rough):**
- One-time: ~$50-70k
- Annual operating: ~$150-200k
- Per-person cost: ~$7.5k-10k (full 2-3 years)

---

## SUCCESS METRICS

### Individual graduate targets:
- 95%+ complete capstone project
- 80%+ pass code quality reviews
- 70%+ achieve min. benchmark performance
- 100% have production project on GitHub
- Job placement rate: 85%+ within 6 months (relevant roles)

### Learning effectiveness:
- Average completion time: 2.5 years @ 20 hrs/week
- Cohort retention: 70%+ through level 3, 50%+ through level 5
- Capstone project quality: portfolio-ready (publishable)
- Community satisfaction: 4.5+/5.0 rating

### Business impact:
- Graduate quality: 85%+ hire at FAANG-adjacent roles
- Reputation: Top 5 locally in LLM/AI training
- Alumni network: Active community, 70%+ mentor future cohorts

---

## CONTINUED LEARNING PATHWAY (Post-Graduation)

### For graduates who want specialization:

1. **Research Engineer Path**
   - Contribute to open-source (Hugging Face, PyTorch)
   - Publish papers (ArXiv, conferences)
   - Join AI research labs (OpenAI, Anthropic, DeepMind)

2. **industry engineer Path**
   - Build production systems at scale
   - Work at AI-first companies (Scale AI, Together, Lambda Labs)
   - Solutions architect for LLM platforms

3. **Entrepreneurship Path**
   - Build LLM products/startups
   - SaaS around RAG, agents, or domain applications
   - Community leadership, content creation

4. **Extended Research Track**
   - Ph.D. programs (fully funded research)
   - Postdocs in academic labs
   - Industry research roles

---

**Ende of Plan**
