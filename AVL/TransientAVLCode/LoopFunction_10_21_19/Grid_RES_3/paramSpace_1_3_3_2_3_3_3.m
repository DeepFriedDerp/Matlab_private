function [aeroForces] = paramSpace_1_3_3_2_3_3_3(sailStates,airStates)

	CL = (4.071700)*sailStates.alpha + (-0.031961)*sailStates.beta + (-2.788608)*sailStates.p + (35.143391)*sailStates.q + (-0.177407)*sailStates.r + (0.010265)*sailStates.de;
	CD = -0.251200;
	CY = (0.145549)*sailStates.alpha + (-0.022497)*sailStates.beta + (0.129157)*sailStates.p + (1.027328)*sailStates.q + (0.022872)*sailStates.r + (0.000219)*sailStates.de;

	Cl = (1.249250)*sailStates.alpha + (-0.093273)*sailStates.beta + (-1.411075)*sailStates.p + (11.536371)*sailStates.q + (0.112335)*sailStates.r + (0.000688)*sailStates.de;
	Cm = (-14.699129)*sailStates.alpha + (0.246175)*sailStates.beta + (9.908871)*sailStates.p + (-144.553238)*sailStates.q + (0.597936)*sailStates.r + (-0.068478)*sailStates.de;
	Cn = (0.037137)*sailStates.alpha + (-0.014944)*sailStates.beta + (-0.530783)*sailStates.p + (2.324534)*sailStates.q + (-0.030332)*sailStates.r + (-0.000262)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end