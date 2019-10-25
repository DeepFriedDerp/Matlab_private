function [aeroForces] = paramSpace_1_2_1_2_2_1_3(sailStates,airStates)

	CL = (4.439162)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.961598)*sailStates.p + (41.799488)*sailStates.q + (-2.051524)*sailStates.r + (0.011484)*sailStates.de;
	CD = -0.491880;
	CY = (-0.088732)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.731278)*sailStates.p + (0.267956)*sailStates.q + (-0.128970)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.520641)*sailStates.alpha + (0.354952)*sailStates.beta + (-1.516532)*sailStates.p + (13.796809)*sailStates.q + (-1.697691)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-12.309625)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.981204)*sailStates.p + (-146.430145)*sailStates.q + (6.874691)*sailStates.r + (-0.069510)*sailStates.de;
	Cn = (0.448570)*sailStates.alpha + (0.062588)*sailStates.beta + (1.403008)*sailStates.p + (-5.495555)*sailStates.q + (-0.005030)*sailStates.r + (-0.000188)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end