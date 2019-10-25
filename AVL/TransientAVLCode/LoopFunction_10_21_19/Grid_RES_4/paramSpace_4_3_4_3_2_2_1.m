function [aeroForces] = paramSpace_4_3_4_3_2_2_1(sailStates,airStates)

	CL = (3.791603)*sailStates.alpha + (-0.074338)*sailStates.beta + (-2.228530)*sailStates.p + (33.217796)*sailStates.q + (0.897584)*sailStates.r + (0.010384)*sailStates.de;
	CD = 0.088210;
	CY = (0.000914)*sailStates.alpha + (-0.025204)*sailStates.beta + (0.212330)*sailStates.p + (0.194782)*sailStates.q + (-0.042214)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.044271)*sailStates.alpha + (-0.131838)*sailStates.beta + (-0.941066)*sailStates.p + (7.729985)*sailStates.q + (0.626473)*sailStates.r + (-0.000040)*sailStates.de;
	Cm = (-13.336665)*sailStates.alpha + (0.298161)*sailStates.beta + (7.348121)*sailStates.p + (-127.822792)*sailStates.q + (-3.048340)*sailStates.r + (-0.067003)*sailStates.de;
	Cn = (-0.012980)*sailStates.alpha + (0.023540)*sailStates.beta + (-0.320528)*sailStates.p + (0.686190)*sailStates.q + (-0.023921)*sailStates.r + (-0.000047)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end