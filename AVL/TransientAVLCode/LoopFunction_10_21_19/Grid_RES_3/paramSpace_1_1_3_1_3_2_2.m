function [aeroForces] = paramSpace_1_1_3_1_3_2_2(sailStates,airStates)

	CL = (4.206749)*sailStates.alpha + (-0.190627)*sailStates.beta + (-2.442551)*sailStates.p + (35.191578)*sailStates.q + (-1.293248)*sailStates.r + (0.010701)*sailStates.de;
	CD = -0.046040;
	CY = (0.219243)*sailStates.alpha + (-0.028629)*sailStates.beta + (-0.444377)*sailStates.p + (1.671347)*sailStates.q + (-0.078197)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (1.506788)*sailStates.alpha + (0.078807)*sailStates.beta + (-1.182050)*sailStates.p + (10.426536)*sailStates.q + (-0.929009)*sailStates.r + (0.000345)*sailStates.de;
	Cm = (-14.244468)*sailStates.alpha + (0.604649)*sailStates.beta + (7.762052)*sailStates.p + (-132.498779)*sailStates.q + (4.279988)*sailStates.r + (-0.067243)*sailStates.de;
	Cn = (-0.159389)*sailStates.alpha + (0.030068)*sailStates.beta + (0.794653)*sailStates.p + (-4.287345)*sailStates.q + (0.012594)*sailStates.r + (-0.000547)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end