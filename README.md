# NexusPlan (Research-Integrated Project & Graph Engine)

> A high-performance developer platform that transforms research papers and project tasks into an optimized execution schedule using Data Structures and Algorithms (DSA).

---

## 🌌 Overview & Core Concept

**NexusPlan** bridges cutting-edge academic research and engineering execution. It catalogs research papers, indexes their abstracts and methodologies using the **Rabin-Karp string matching algorithm**, and translates them into an actionable **Directed Acyclic Graph (DAG)** of engineering tasks.

The backend algorithm engine uses graph theory and priority queues to:
- Formulate deterministic, acyclic execution schedules via **Kahn's Topological Sort**.
- Interactively detect and highlight **Circular Dependency Deadlocks** ($A \rightarrow B \rightarrow A$).
- Simulate multi-worker schedule dispatching with a **Min-Heap / Priority Queue**.
- Perform **Breadth-First Search (BFS)** and **Depth-First Search (DFS)** graph explorations with real-time state logs.
- Provide full **$O(V + E)$ complexity diagnostics** and code inspector drawers in the Algorithm Lab.

---

## 🎨 Design & Style Aesthetic

- **Color Palette**:
  - Background: `#090D16`
  - Surface: `#111827`
  - Elevated Surface: `#1E293B`
  - Primary Cyan: `#38BDF8`
  - Accent Purple: `#8B5CF6`
  - Emerald Green: `#10B981`
  - Amber Warning: `#F59E0B`
  - Rose Crimson: `#F43F5E`
- **Glassmorphic Cards**: `backdrop-filter: blur(16px)` with subtle glowing borders.
- **Interactive SVG Canvas DAG Visualizer**:
  - Drag, pan, zoom, reset, and fit to screen.
  - Interactive node repositioning with coordinate persistence.
  - Animated directional edges (pulsing cyan energy particles flowing in the direction of dependency).
  - Neon crimson deadlock highlight when cycles are present.

---

## 🛠️ Tech Stack

### Frontend
- **React 19** with **Vite**
- **Lucide Icons**
- **Recharts** (Donut priority distribution and lifecycle bar charts)
- **Canvas Confetti**
- **Axios** with JWT Authorization interceptor & Vite `/api` proxy

### Backend
- **Java 21/26**
- **Spring Boot 3.2.5**
  - `spring-boot-starter-web` (REST APIs)
  - `spring-boot-starter-security` & **JJWT 0.12.5** (JWT Token Authentication)
  - `spring-boot-starter-data-jpa` (Hibernate ORM)
- **Database**:
  - **MySQL 8.0** ready (`application-mysql.yml`)
  - **H2 Persistent File Mode** default (`application-dev.yml`) for instant zero-dependency launch

---

## 🧠 Algorithmic Engine & DSA Implementations

| Algorithm | Complexity | Purpose in NexusPlan |
| :--- | :--- | :--- |
| **Rabin-Karp** | $O(N + M)$ avg, $O(1)$ space | Rolling-hash pattern matching with prime base $d=256$, modulus $q=10^9+7$ to query research paper abstracts and methodologies. |
| **Kahn's Topological Sort** | $O(V + E)$ time, $O(V)$ space | Deterministic linear ordering of tasks based on in-degrees; detects cycle deadlocks ($A \to B \to A$) if processed vertices $< \|V\|$. |
| **BFS Traversal** | $O(V + E)$ time, $O(V)$ space | Level-order queue exploration of downstream dependencies with step-by-step playback controls. |
| **DFS Traversal** | $O(V + E)$ time, $O(V)$ space | Deep branch recursion with call-stack tracking, discovery/finish timestamps ($d[u]/f[u]$), and back-edge cycle detection. |
| **Min-Heap Dispatcher** | $O(V \log V + E)$ time, $O(V)$ space | Priority Queue that schedules ready tasks across a simulated multi-worker pool (CRITICAL, HIGH, MEDIUM, LOW weights + duration tiebreaker). |
| **Critical Path Method (CPM)** | $O(V + E)$ time | Dynamic programming over DAG topological order: $\text{dist}[v] = \max_{(u,v)} (\text{dist}[u] + \text{dur}[v])$ to compute maximum project makespan. |

---

## 🚀 Running the Application

### Method 1: One-Click Script (Windows)
Double-click [`start.bat`](file:///c:/Users/ZENPAQ/OneDrive/dsa%20project%20tej/start.bat) in the root directory.

### Method 2: Manual Terminal Commands

#### 1. Start the Spring Boot Backend
```powershell
cd backend
..\.tools\apache-maven-3.9.6\bin\mvn.cmd spring-boot:run
```
*Backend runs on `http://localhost:8080` (H2 database persisted in `./data/nexusplan_db.mv.db`).*

#### 2. Start the React Frontend
```powershell
cd frontend
npm run dev
```
*Frontend runs on `http://localhost:5173`.*

---

## 📡 Key REST API Endpoints

- `GET /api/dashboard/stats`: KPI metrics, graph density, critical path hours, priority/status distribution.
- `GET /api/papers`: List all research papers.
- `POST /api/papers/search`: Rabin-Karp substring pattern search across paper abstracts.
- `GET /api/tasks`: List all tasks with positions, priorities, and duration.
- `GET /api/dependencies`: List all directed edges in the DAG.
- `POST /api/dependencies/toggle-deadlock`: Injects or clears circular dependency cycle ($A \to B \to A$).
- `POST /api/algorithms/topological-sort`: Kahn's algorithm execution and deadlock diagnostic.
- `POST /api/algorithms/bfs`: Breadth-first traversal with queue states.
- `POST /api/algorithms/dfs`: Depth-first traversal with call stack snapshots.
- `POST /api/algorithms/dispatch`: Min-heap multi-worker scheduling simulation.
- `GET /api/algorithms/diagnostics`: Complexity analysis and Java code snippets.
- `POST /api/seed`: Re-populates seminal papers and clean verified DAG topology.
