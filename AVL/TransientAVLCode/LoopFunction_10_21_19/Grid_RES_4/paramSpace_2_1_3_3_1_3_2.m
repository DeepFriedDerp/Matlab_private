function [aeroForces] = paramSpace_2_1_3_3_1_3_2(sailStates,airStates)

	CL = (4.243631)*sailStates.alpha + (0.111751)*sailStates.beta + (-2.535236)*sailStates.p + (33.886261)*sailStates.q + (0.455977)*sailStates.r + (0.010733)*sailStates.de;
	CD = -0.203680;
	CY = (-0.060486)*sailStates.alpha + (-0.024307)*sailStates.beta + (0.321261)*sailStates.p + (-0.498142)*sailStates.q + (0.021039)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.416218)*sailStates.alpha + (-0.109860)*sailStates.beta + (-1.245489)*sailStates.p + (10.101152)*sailStates.q + (0.498558)*sailStates.r + (0.000480)*sailStates.de;
	Cm = (-14.943114)*sailStates.alpha + (-0.475811)*sailStates.beta + (8.893784)*sailStates.p + (-136.384659)*sailStates.q + (-1.549498)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (0.229397)*sailStates.alpha + (-0.011137)*sailStates.beta + (-0.770874)*sailStates.p + (4.078932)*sailStates.q + (-0.012513)*sailStates.r + (0.000200)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end