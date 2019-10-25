function [aeroForces] = paramSpace_7_1_4_1_2_1_2(sailStates,airStates)

	CL = (5.142119)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.101845)*sailStates.p + (39.937149)*sailStates.q + (-1.735576)*sailStates.r + (0.011548)*sailStates.de;
	CD = -0.947250;
	CY = (-0.033730)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.793656)*sailStates.p + (1.046665)*sailStates.q + (-0.027605)*sailStates.r + (0.000228)*sailStates.de;

	Cl = (1.940889)*sailStates.alpha + (0.354457)*sailStates.beta + (-1.633863)*sailStates.p + (13.876379)*sailStates.q + (-1.522267)*sailStates.r + (0.001016)*sailStates.de;
	Cm = (-14.715235)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.323180)*sailStates.p + (-151.326889)*sailStates.q + (5.848353)*sailStates.r + (-0.071886)*sailStates.de;
	Cn = (0.306447)*sailStates.alpha + (0.012378)*sailStates.beta + (1.713535)*sailStates.p + (-8.506558)*sailStates.q + (0.008278)*sailStates.r + (-0.000484)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end