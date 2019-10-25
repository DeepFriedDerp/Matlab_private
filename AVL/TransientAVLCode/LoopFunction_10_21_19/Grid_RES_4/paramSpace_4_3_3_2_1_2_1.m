function [aeroForces] = paramSpace_4_3_3_2_1_2_1(sailStates,airStates)

	CL = (3.896832)*sailStates.alpha + (-0.074034)*sailStates.beta + (-2.070104)*sailStates.p + (32.128136)*sailStates.q + (1.028019)*sailStates.r + (0.010405)*sailStates.de;
	CD = 0.037230;
	CY = (-0.110743)*sailStates.alpha + (-0.024476)*sailStates.beta + (0.301193)*sailStates.p + (-0.455227)*sailStates.q + (-0.059927)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.032896)*sailStates.alpha + (-0.152795)*sailStates.beta + (-0.815242)*sailStates.p + (6.686065)*sailStates.q + (0.717063)*sailStates.r + (-0.000269)*sailStates.de;
	Cm = (-13.405437)*sailStates.alpha + (0.275136)*sailStates.beta + (6.656915)*sailStates.p + (-122.911674)*sailStates.q + (-3.443356)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (0.227748)*sailStates.alpha + (0.025982)*sailStates.beta + (-0.539370)*sailStates.p + (2.367870)*sailStates.q + (-0.003092)*sailStates.r + (0.000159)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end