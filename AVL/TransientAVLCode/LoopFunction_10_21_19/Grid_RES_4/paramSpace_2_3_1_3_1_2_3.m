function [aeroForces] = paramSpace_2_3_1_3_1_2_3(sailStates,airStates)

	CL = (3.985610)*sailStates.alpha + (0.029674)*sailStates.beta + (-2.831504)*sailStates.p + (37.074894)*sailStates.q + (-0.251277)*sailStates.r + (0.011124)*sailStates.de;
	CD = 0.044930;
	CY = (-0.056991)*sailStates.alpha + (-0.025176)*sailStates.beta + (-0.028202)*sailStates.p + (-0.432842)*sailStates.q + (-0.001803)*sailStates.r + (-0.000094)*sailStates.de;

	Cl = (1.312411)*sailStates.alpha + (0.037416)*sailStates.beta + (-1.407226)*sailStates.p + (11.549779)*sailStates.q + (-0.185493)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-14.464332)*sailStates.alpha + (-0.138384)*sailStates.beta + (9.677322)*sailStates.p + (-144.575439)*sailStates.q + (0.890256)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (0.136173)*sailStates.alpha + (0.002541)*sailStates.beta + (-0.021449)*sailStates.p + (0.838389)*sailStates.q + (-0.007864)*sailStates.r + (0.000145)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end