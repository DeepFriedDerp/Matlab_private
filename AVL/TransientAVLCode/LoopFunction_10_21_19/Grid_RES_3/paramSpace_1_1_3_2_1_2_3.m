function [aeroForces] = paramSpace_1_1_3_2_1_2_3(sailStates,airStates)

	CL = (3.772328)*sailStates.alpha + (-0.130094)*sailStates.beta + (-2.897699)*sailStates.p + (38.127048)*sailStates.q + (-0.806084)*sailStates.r + (0.010913)*sailStates.de;
	CD = 0.065770;
	CY = (-0.078189)*sailStates.alpha + (-0.023714)*sailStates.beta + (-0.099074)*sailStates.p + (-0.491415)*sailStates.q + (-0.017516)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.328507)*sailStates.alpha + (0.018256)*sailStates.beta + (-1.542483)*sailStates.p + (13.373360)*sailStates.q + (-0.529639)*sailStates.r + (0.001009)*sailStates.de;
	Cm = (-13.714316)*sailStates.alpha + (0.403443)*sailStates.beta + (9.776690)*sailStates.p + (-146.474228)*sailStates.q + (2.701012)*sailStates.r + (-0.068685)*sailStates.de;
	Cn = (0.313817)*sailStates.alpha + (0.006972)*sailStates.beta + (0.013627)*sailStates.p + (1.155262)*sailStates.q + (-0.043194)*sailStates.r + (0.000112)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end