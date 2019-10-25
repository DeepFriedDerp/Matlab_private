function [aeroForces] = paramSpace_2_1_3_3_1_1_2(sailStates,airStates)

	CL = (4.147009)*sailStates.alpha + (-0.192453)*sailStates.beta + (-2.569288)*sailStates.p + (35.448009)*sailStates.q + (-0.849020)*sailStates.r + (0.011046)*sailStates.de;
	CD = -0.137260;
	CY = (-0.062661)*sailStates.alpha + (-0.024307)*sailStates.beta + (-0.295398)*sailStates.p + (-0.498142)*sailStates.q + (-0.019379)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.303712)*sailStates.alpha + (0.110678)*sailStates.beta + (-1.256261)*sailStates.p + (10.513488)*sailStates.q + (-0.722457)*sailStates.r + (0.000480)*sailStates.de;
	Cm = (-14.110808)*sailStates.alpha + (0.717964)*sailStates.beta + (8.603853)*sailStates.p + (-136.384659)*sailStates.q + (2.873978)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (0.036421)*sailStates.alpha + (0.010869)*sailStates.beta + (0.613778)*sailStates.p + (-2.212086)*sailStates.q + (-0.001723)*sailStates.r + (0.000083)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end