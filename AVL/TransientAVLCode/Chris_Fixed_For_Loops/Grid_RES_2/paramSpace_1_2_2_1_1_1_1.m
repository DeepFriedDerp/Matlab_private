function [aeroForces] = paramSpace_1_2_2_1_1_1_1(sailStates,airStates)

	CL = (5.592970)*sailStates.alpha + (-0.811856)*sailStates.beta + (-5.941708)*sailStates.p + (54.545578)*sailStates.q + (2.452551)*sailStates.r + (0.011061)*sailStates.de;
	CD = -7.873460;
	CY = (2.653280)*sailStates.alpha + (-0.019415)*sailStates.beta + (1.405648)*sailStates.p + (4.164557)*sailStates.q + (0.186237)*sailStates.r + (0.000944)*sailStates.de;

	Cl = (-1.186904)*sailStates.alpha + (-1.013479)*sailStates.beta + (-4.064950)*sailStates.p + (34.867878)*sailStates.q + (2.690424)*sailStates.r + (0.005278)*sailStates.de;
	Cm = (5.727743)*sailStates.alpha + (3.532197)*sailStates.beta + (22.257404)*sailStates.p + (-235.670822)*sailStates.q + (-8.392181)*sailStates.r + (-0.081817)*sailStates.de;
	Cn = (-9.816238)*sailStates.alpha + (-0.100489)*sailStates.beta + (-3.774407)*sailStates.p + (15.903261)*sailStates.q + (-0.076896)*sailStates.r + (-0.000837)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end