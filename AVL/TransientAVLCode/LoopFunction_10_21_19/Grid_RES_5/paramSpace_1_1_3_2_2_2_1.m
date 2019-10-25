function [aeroForces] = paramSpace_1_1_3_2_2_2_1(sailStates,airStates)

	CL = (3.801132)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.164545)*sailStates.p + (31.408703)*sailStates.q + (-0.663822)*sailStates.r + (0.009900)*sailStates.de;
	CD = 0.015310;
	CY = (0.029161)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.049801)*sailStates.p + (0.199285)*sailStates.q + (-0.012410)*sailStates.r + (0.000042)*sailStates.de;

	Cl = (1.058117)*sailStates.alpha + (0.017067)*sailStates.beta + (-0.946599)*sailStates.p + (7.751582)*sailStates.q + (-0.318581)*sailStates.r + (0.000027)*sailStates.de;
	Cm = (-14.062458)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.466054)*sailStates.p + (-127.104668)*sailStates.q + (2.256576)*sailStates.r + (-0.065753)*sailStates.de;
	Cn = (0.152041)*sailStates.alpha + (0.004255)*sailStates.beta + (-0.080564)*sailStates.p + (0.824621)*sailStates.q + (-0.040729)*sailStates.r + (-0.000050)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end