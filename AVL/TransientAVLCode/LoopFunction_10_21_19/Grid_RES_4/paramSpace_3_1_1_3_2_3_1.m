function [aeroForces] = paramSpace_3_1_1_3_2_3_1(sailStates,airStates)

	CL = (4.212836)*sailStates.alpha + (0.184345)*sailStates.beta + (-2.304251)*sailStates.p + (33.350765)*sailStates.q + (0.936860)*sailStates.r + (0.010952)*sailStates.de;
	CD = -0.173210;
	CY = (-0.029643)*sailStates.alpha + (-0.024737)*sailStates.beta + (0.350626)*sailStates.p + (0.065299)*sailStates.q + (-0.022988)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.245663)*sailStates.alpha + (-0.115731)*sailStates.beta + (-1.040668)*sailStates.p + (8.548741)*sailStates.q + (0.777363)*sailStates.r + (0.000129)*sailStates.de;
	Cm = (-14.200250)*sailStates.alpha + (-0.628439)*sailStates.beta + (7.680956)*sailStates.p + (-129.003830)*sailStates.q + (-3.147666)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (0.208307)*sailStates.alpha + (0.012151)*sailStates.beta + (-0.749667)*sailStates.p + (3.301633)*sailStates.q + (0.002418)*sailStates.r + (0.000055)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end