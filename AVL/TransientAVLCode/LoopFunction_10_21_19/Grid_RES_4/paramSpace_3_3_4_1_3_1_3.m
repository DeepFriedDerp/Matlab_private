function [aeroForces] = paramSpace_3_3_4_1_3_1_3(sailStates,airStates)

	CL = (6.819860)*sailStates.alpha + (0.154143)*sailStates.beta + (-3.409939)*sailStates.p + (39.409359)*sailStates.q + (-2.199662)*sailStates.r + (0.010916)*sailStates.de;
	CD = -2.724200;
	CY = (-0.266282)*sailStates.alpha + (-0.025657)*sailStates.beta + (-1.189442)*sailStates.p + (1.471499)*sailStates.q + (0.078115)*sailStates.r + (0.000322)*sailStates.de;

	Cl = (2.750310)*sailStates.alpha + (0.581174)*sailStates.beta + (-1.906465)*sailStates.p + (15.560518)*sailStates.q + (-2.080804)*sailStates.r + (0.001525)*sailStates.de;
	Cm = (-15.711027)*sailStates.alpha + (-0.576618)*sailStates.beta + (12.392256)*sailStates.p + (-162.286758)*sailStates.q + (7.399921)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (1.013935)*sailStates.alpha + (-0.032540)*sailStates.beta + (2.757049)*sailStates.p + (-14.192651)*sailStates.q + (-0.036553)*sailStates.r + (-0.000720)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end