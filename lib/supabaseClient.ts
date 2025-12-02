
import { createClient } from '@supabase/supabase-js';

// Configuração do Supabase com as novas credenciais fornecidas
const SUPABASE_URL = 'https://sbqepeggfgzgdookahyz.supabase.co';
const SUPABASE_ANON_KEY = 'sb_publishable_kUrkfficyLK3S1bxndELFw_bvDf2yli';

export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
