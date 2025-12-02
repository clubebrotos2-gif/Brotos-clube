-- Enable Row Level Security
ALTER TABLE public.consultants ENABLE ROW LEVEL SECURITY;

-- Policy: Users can view their own consultant profile
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE tablename = 'consultants' 
        AND policyname = 'Users can view their own consultant profile'
    ) THEN
        CREATE POLICY "Users can view their own consultant profile" 
        ON public.consultants 
        FOR SELECT 
        USING (auth.uid() = auth_id);
    END IF;
END $$;

-- Policy: Users can insert their own consultant profile
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE tablename = 'consultants' 
        AND policyname = 'Users can insert their own consultant profile'
    ) THEN
        CREATE POLICY "Users can insert their own consultant profile" 
        ON public.consultants 
        FOR INSERT 
        WITH CHECK (auth.uid() = auth_id);
    END IF;
END $$;

-- Policy: Users can update their own consultant profile
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE tablename = 'consultants' 
        AND policyname = 'Users can update their own consultant profile'
    ) THEN
        CREATE POLICY "Users can update their own consultant profile" 
        ON public.consultants 
        FOR UPDATE 
        USING (auth.uid() = auth_id);
    END IF;
END $$;

-- Policy: Users can delete their own consultant profile
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE tablename = 'consultants' 
        AND policyname = 'Users can delete their own consultant profile'
    ) THEN
        CREATE POLICY "Users can delete their own consultant profile" 
        ON public.consultants 
        FOR DELETE 
        USING (auth.uid() = auth_id);
    END IF;
END $$;
