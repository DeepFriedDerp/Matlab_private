function [aeroForces] = paramSpace_2_3_4_1_3_1_1(sailStates,airStates)

	CL = (7.299951)*sailStates.alpha + (0.200795)*sailStates.beta + (-1.723143)*sailStates.p + (30.529430)*sailStates.q + (-2.870697)*sailStates.r + (0.011219)*sailStates.de;
	CD = -2.909680;
	CY = (0.690316)*sailStates.alpha + (-0.024607)*sailStates.beta + (-1.341421)*sailStates.p + (1.471503)*sailStates.q + (-0.087766)*sailStates.r + (0.000312)*sailStates.de;

	Cl = (2.171149)*sailStates.alpha + (0.672481)*sailStates.beta + (-0.476878)*sailStates.p + (3.608759)*sailStates.q + (-2.538438)*sailStates.r + (-0.000884)*sailStates.de;
	Cm = (-14.132232)*sailStates.alpha + (-0.748013)*sailStates.beta + (5.119223)*sailStates.p + (-112.102478)*sailStates.q + (9.687769)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (-2.656067)*sailStates.alpha + (0.038480)*sailStates.beta + (2.963909)*sailStates.p + (-14.682944)*sailStates.q + (0.029534)*sailStates.r + (-0.000629)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end