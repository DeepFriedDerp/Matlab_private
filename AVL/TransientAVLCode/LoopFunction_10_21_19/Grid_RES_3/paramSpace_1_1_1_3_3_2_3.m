function [aeroForces] = paramSpace_1_1_1_3_3_2_3(sailStates,airStates)

	CL = (3.849685)*sailStates.alpha + (-0.213549)*sailStates.beta + (-2.724823)*sailStates.p + (37.264198)*sailStates.q + (-1.102823)*sailStates.r + (0.010624)*sailStates.de;
	CD = 0.064910;
	CY = (0.049410)*sailStates.alpha + (-0.026671)*sailStates.beta + (-0.322484)*sailStates.p + (0.665001)*sailStates.q + (-0.056926)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.404452)*sailStates.alpha + (0.066025)*sailStates.beta + (-1.407896)*sailStates.p + (12.356676)*sailStates.q + (-0.816762)*sailStates.r + (0.000750)*sailStates.de;
	Cm = (-13.458003)*sailStates.alpha + (0.832905)*sailStates.beta + (8.921624)*sailStates.p + (-141.044128)*sailStates.q + (3.724468)*sailStates.r + (-0.068108)*sailStates.de;
	Cn = (0.174909)*sailStates.alpha + (0.022667)*sailStates.beta + (0.479006)*sailStates.p + (-1.687015)*sailStates.q + (-0.015903)*sailStates.r + (-0.000214)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end