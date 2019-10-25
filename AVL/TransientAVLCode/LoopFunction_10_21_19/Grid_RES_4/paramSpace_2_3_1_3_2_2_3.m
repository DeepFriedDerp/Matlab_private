function [aeroForces] = paramSpace_2_3_1_3_2_2_3(sailStates,airStates)

	CL = (3.995385)*sailStates.alpha + (0.035702)*sailStates.beta + (-2.826492)*sailStates.p + (37.102394)*sailStates.q + (-0.381375)*sailStates.r + (0.011123)*sailStates.de;
	CD = 0.044710;
	CY = (-0.003574)*sailStates.alpha + (-0.024946)*sailStates.beta + (-0.108731)*sailStates.p + (0.065300)*sailStates.q + (-0.007134)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.323454)*sailStates.alpha + (0.060367)*sailStates.beta + (-1.404105)*sailStates.p + (11.558484)*sailStates.q + (-0.291779)*sailStates.r + (0.000645)*sailStates.de;
	Cm = (-14.457582)*sailStates.alpha + (-0.158941)*sailStates.beta + (9.620144)*sailStates.p + (-144.341232)*sailStates.q + (1.324503)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (0.081421)*sailStates.alpha + (0.003542)*sailStates.beta + (0.143925)*sailStates.p + (-0.280149)*sailStates.q + (-0.003926)*sailStates.r + (-0.000012)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end