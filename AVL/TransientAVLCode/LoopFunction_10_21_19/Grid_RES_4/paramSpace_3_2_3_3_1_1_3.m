function [aeroForces] = paramSpace_3_2_3_3_1_1_3(sailStates,airStates)

	CL = (4.118828)*sailStates.alpha + (-0.016349)*sailStates.beta + (-2.804721)*sailStates.p + (36.332367)*sailStates.q + (-0.150151)*sailStates.r + (0.010995)*sailStates.de;
	CD = -0.099520;
	CY = (-0.084128)*sailStates.alpha + (-0.025197)*sailStates.beta + (-0.134106)*sailStates.p + (-0.563441)*sailStates.q + (0.008770)*sailStates.r + (-0.000122)*sailStates.de;

	Cl = (1.366566)*sailStates.alpha + (0.086873)*sailStates.beta + (-1.428375)*sailStates.p + (11.764140)*sailStates.q + (-0.234451)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.728404)*sailStates.alpha + (0.066086)*sailStates.beta + (9.711412)*sailStates.p + (-144.107025)*sailStates.q + (0.506080)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (-0.002771)*sailStates.alpha + (-0.006107)*sailStates.beta + (0.407398)*sailStates.p + (-1.784817)*sailStates.q + (-0.005191)*sailStates.r + (0.000119)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end