function [aeroForces] = paramSpace_1_2_3_2_2_2_3(sailStates,airStates)

	CL = (3.886629)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.894591)*sailStates.p + (38.476322)*sailStates.q + (-1.007348)*sailStates.r + (0.011055)*sailStates.de;
	CD = 0.057640;
	CY = (-0.003750)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.221473)*sailStates.p + (0.267956)*sailStates.q + (-0.039026)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.337699)*sailStates.alpha + (0.100045)*sailStates.beta + (-1.495637)*sailStates.p + (12.944989)*sailStates.q + (-0.686269)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-13.923293)*sailStates.alpha + (0.000000)*sailStates.beta + (9.601471)*sailStates.p + (-146.430145)*sailStates.q + (3.356984)*sailStates.r + (-0.069510)*sailStates.de;
	Cn = (0.240422)*sailStates.alpha + (0.017641)*sailStates.beta + (0.276780)*sailStates.p + (-0.664643)*sailStates.q + (-0.025977)*sailStates.r + (-0.000124)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end