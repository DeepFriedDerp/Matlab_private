function [aeroForces] = paramSpace_3_2_3_2_1_3_2(sailStates,airStates)

	CL = (4.851053)*sailStates.alpha + (0.114849)*sailStates.beta + (-2.585124)*sailStates.p + (36.227436)*sailStates.q + (1.548024)*sailStates.r + (0.011267)*sailStates.de;
	CD = -0.615190;
	CY = (-0.099554)*sailStates.alpha + (-0.025278)*sailStates.beta + (0.684337)*sailStates.p + (-0.769433)*sailStates.q + (-0.044881)*sailStates.r + (-0.000166)*sailStates.de;

	Cl = (1.646476)*sailStates.alpha + (-0.276991)*sailStates.beta + (-1.227811)*sailStates.p + (10.321208)*sailStates.q + (1.350109)*sailStates.r + (0.000370)*sailStates.de;
	Cm = (-14.535645)*sailStates.alpha + (-0.447641)*sailStates.beta + (8.442449)*sailStates.p + (-136.832825)*sailStates.q + (-5.247096)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (0.245878)*sailStates.alpha + (0.021185)*sailStates.beta + (-1.437943)*sailStates.p + (6.817157)*sailStates.q + (0.011027)*sailStates.r + (0.000335)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end