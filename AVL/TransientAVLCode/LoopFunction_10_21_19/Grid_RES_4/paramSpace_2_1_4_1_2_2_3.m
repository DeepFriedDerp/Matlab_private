function [aeroForces] = paramSpace_2_1_4_1_2_2_3(sailStates,airStates)

	CL = (3.664757)*sailStates.alpha + (-0.052129)*sailStates.beta + (-3.432320)*sailStates.p + (41.845615)*sailStates.q + (-0.431943)*sailStates.r + (0.011378)*sailStates.de;
	CD = 0.033970;
	CY = (-0.004812)*sailStates.alpha + (-0.024953)*sailStates.beta + (-0.088286)*sailStates.p + (0.221996)*sailStates.q + (-0.005763)*sailStates.r + (0.000048)*sailStates.de;

	Cl = (1.417083)*sailStates.alpha + (0.004822)*sailStates.beta + (-1.970629)*sailStates.p + (17.021694)*sailStates.q + (-0.288050)*sailStates.r + (0.001647)*sailStates.de;
	Cm = (-13.365510)*sailStates.alpha + (0.096770)*sailStates.beta + (11.649196)*sailStates.p + (-160.446365)*sailStates.q + (1.422137)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (0.157133)*sailStates.alpha + (0.001738)*sailStates.beta + (0.090624)*sailStates.p + (-0.233090)*sailStates.q + (-0.004800)*sailStates.r + (-0.000104)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end