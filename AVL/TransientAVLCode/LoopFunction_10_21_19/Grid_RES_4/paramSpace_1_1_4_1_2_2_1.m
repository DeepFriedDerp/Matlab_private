function [aeroForces] = paramSpace_1_1_4_1_2_2_1(sailStates,airStates)

	CL = (3.587050)*sailStates.alpha + (-0.126543)*sailStates.beta + (-1.609771)*sailStates.p + (27.677700)*sailStates.q + (-0.625226)*sailStates.r + (0.010218)*sailStates.de;
	CD = 0.043000;
	CY = (-0.046559)*sailStates.alpha + (-0.022885)*sailStates.beta + (-0.093569)*sailStates.p + (-0.662188)*sailStates.q + (-0.018683)*sailStates.r + (-0.000137)*sailStates.de;

	Cl = (0.641000)*sailStates.alpha + (0.039174)*sailStates.beta + (-0.502293)*sailStates.p + (3.684949)*sailStates.q + (-0.366934)*sailStates.r + (-0.000648)*sailStates.de;
	Cm = (-12.896893)*sailStates.alpha + (0.382879)*sailStates.beta + (5.369124)*sailStates.p + (-109.940704)*sailStates.q + (2.088783)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (-0.075792)*sailStates.alpha + (0.012341)*sailStates.beta + (0.184410)*sailStates.p + (-0.367128)*sailStates.q + (-0.016606)*sailStates.r + (0.000172)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end