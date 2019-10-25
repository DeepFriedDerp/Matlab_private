function [aeroForces] = paramSpace_3_2_2_3_1_2_1(sailStates,airStates)

	CL = (4.068546)*sailStates.alpha + (0.024146)*sailStates.beta + (-2.301523)*sailStates.p + (32.879852)*sailStates.q + (0.425322)*sailStates.r + (0.010932)*sailStates.de;
	CD = 0.019300;
	CY = (-0.069302)*sailStates.alpha + (-0.025115)*sailStates.beta + (0.138142)*sailStates.p + (-0.432842)*sailStates.q + (-0.009039)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.166831)*sailStates.alpha + (-0.042552)*sailStates.beta + (-1.008715)*sailStates.p + (8.024171)*sailStates.q + (0.296292)*sailStates.r + (0.000035)*sailStates.de;
	Cm = (-14.678524)*sailStates.alpha + (-0.076884)*sailStates.beta + (7.832268)*sailStates.p + (-129.813766)*sailStates.q + (-1.426396)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (0.095712)*sailStates.alpha + (0.003484)*sailStates.beta + (-0.247381)*sailStates.p + (1.314304)*sailStates.q + (0.001073)*sailStates.r + (0.000147)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end