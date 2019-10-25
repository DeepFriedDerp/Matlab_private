function [aeroForces] = paramSpace_1_4_4_3_1_3_1(sailStates,airStates)

	CL = (3.991786)*sailStates.alpha + (-0.011240)*sailStates.beta + (-2.176090)*sailStates.p + (30.394703)*sailStates.q + (-0.079230)*sailStates.r + (0.010029)*sailStates.de;
	CD = -0.143430;
	CY = (-0.104165)*sailStates.alpha + (-0.026751)*sailStates.beta + (0.213268)*sailStates.p + (-0.684400)*sailStates.q + (0.042348)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.026160)*sailStates.alpha + (-0.078477)*sailStates.beta + (-0.894956)*sailStates.p + (6.611964)*sailStates.q + (0.170594)*sailStates.r + (-0.000095)*sailStates.de;
	Cm = (-14.841554)*sailStates.alpha + (0.152012)*sailStates.beta + (7.913656)*sailStates.p + (-127.495163)*sailStates.q + (0.305447)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (0.398704)*sailStates.alpha + (-0.008528)*sailStates.beta + (-0.594115)*sailStates.p + (3.479650)*sailStates.q + (-0.049041)*sailStates.r + (0.000227)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end