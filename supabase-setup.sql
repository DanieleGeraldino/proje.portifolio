-- ============================================
-- DANIELE GERALDINO PORTFOLIO — SUPABASE SETUP
-- Cole este SQL no editor do Supabase
-- ============================================

-- Tabela de projetos
CREATE TABLE projects (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  category TEXT,
  description TEXT,
  image_url TEXT,
  link TEXT,
  bg TEXT DEFAULT 'linear-gradient(135deg,#999,#777)',
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Tabela de marcas
CREATE TABLE brands (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Tabela de contatos (formulário)
CREATE TABLE contacts (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  subject TEXT,
  message TEXT NOT NULL,
  read BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ────────────────────────────────────────────
-- Permissões públicas (Row Level Security)
-- ────────────────────────────────────────────

-- Habilita RLS
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE brands ENABLE ROW LEVEL SECURITY;
ALTER TABLE contacts ENABLE ROW LEVEL SECURITY;

-- Qualquer pessoa pode LER projetos e marcas (portfólio público)
CREATE POLICY "Projetos públicos" ON projects FOR SELECT USING (true);
CREATE POLICY "Marcas públicas" ON brands FOR SELECT USING (true);

-- Qualquer pessoa pode INSERIR contatos (formulário público)
CREATE POLICY "Enviar contato" ON contacts FOR INSERT WITH CHECK (true);

-- ────────────────────────────────────────────
-- Dados iniciais de exemplo
-- ────────────────────────────────────────────

INSERT INTO projects (title, category, bg) VALUES
  ('Identidade Visual', 'Branding · 2024', 'linear-gradient(135deg,#a8a89e,#787870)'),
  ('Design Editorial', 'Print · 2024', 'linear-gradient(135deg,#909088,#606058)'),
  ('Campanha Digital', 'Art Direction · 2023', 'linear-gradient(135deg,#7a7a72,#5a5a52)'),
  ('Motion Design', 'Digital · 2023', 'linear-gradient(135deg,#b0b0a8,#888880)');

INSERT INTO brands (name) VALUES
  ('Marca A'), ('Marca B'), ('Marca C'),
  ('Marca D'), ('Marca E'), ('Marca F');
