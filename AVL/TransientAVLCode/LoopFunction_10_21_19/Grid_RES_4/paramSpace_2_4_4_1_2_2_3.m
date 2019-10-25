function [aeroForces] = paramSpace_2_4_4_1_2_2_3(sailStates,airStates)

	CL = (3.664757)*sailStates.alpha + (0.052129)*sailStates.beta + (-3.432320)*sailStates.p + (41.845612)*sailStates.q + (-0.431943)*sailStates.r + (0.011378)*sailStates.de;
	CD = 0.033970;
	CY = (-0.004812)*sailStates.alpha + (-0.024620)*sailStates.beta + (-0.088286)*sailStates.p + (0.221996)*sailStates.q + (-0.005763)*sailStates.r + (0.000048)*sailStates.de;

	Cl = (1.303804)*sailStates.alpha + (0.064009)*sailStates.beta + (-1.872924)*sailStates.p + (15.813132)*sailStates.q + (-0.281774)*sailStates.r + (0.001384)*sailStates.de;
	Cm = (-13.365510)*sailStates.alpha + (-0.096770)*sailStates.beta + (11.649196)*sailStates.p + (-160.446381)*sailStates.q + (1.422137)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (0.140488)*sailStates.alpha + (0.002773)*sailStates.beta + (0.097028)*sailStates.p + (-0.312304)*sailStates.q + (-0.004389)*sailStates.r + (-0.000104)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end