function [aeroForces] = paramSpace_3_1_1_3_1_3_2(sailStates,airStates)

	CL = (4.347560)*sailStates.alpha + (0.206892)*sailStates.beta + (-2.559508)*sailStates.p + (35.486584)*sailStates.q + (1.100534)*sailStates.r + (0.011074)*sailStates.de;
	CD = -0.232340;
	CY = (-0.063225)*sailStates.alpha + (-0.025160)*sailStates.beta + (0.441622)*sailStates.p + (-0.498143)*sailStates.q + (-0.028893)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.469095)*sailStates.alpha + (-0.127057)*sailStates.beta + (-1.250144)*sailStates.p + (10.530143)*sailStates.q + (0.911209)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.411211)*sailStates.alpha + (-0.704848)*sailStates.beta + (8.492762)*sailStates.p + (-135.916275)*sailStates.q + (-3.692676)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (0.126557)*sailStates.alpha + (0.014064)*sailStates.beta + (-0.922625)*sailStates.p + (4.437659)*sailStates.q + (0.005790)*sailStates.r + (0.000236)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end