function [aeroForces] = paramSpace_1_2_2_3_3_3_1(sailStates,airStates)

	CL = (3.964817)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.192228)*sailStates.p + (31.110952)*sailStates.q + (-0.257794)*sailStates.r + (0.010216)*sailStates.de;
	CD = -0.059720;
	CY = (0.032707)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.055201)*sailStates.p + (0.318253)*sailStates.q + (0.009733)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.069086)*sailStates.alpha + (-0.040295)*sailStates.beta + (-0.945134)*sailStates.p + (7.383916)*sailStates.q + (-0.021895)*sailStates.r + (-0.000027)*sailStates.de;
	Cm = (-14.608592)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.728004)*sailStates.p + (-127.854218)*sailStates.q + (0.893938)*sailStates.r + (-0.067624)*sailStates.de;
	Cn = (0.174359)*sailStates.alpha + (-0.007105)*sailStates.beta + (-0.272871)*sailStates.p + (1.425790)*sailStates.q + (-0.022590)*sailStates.r + (-0.000065)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end