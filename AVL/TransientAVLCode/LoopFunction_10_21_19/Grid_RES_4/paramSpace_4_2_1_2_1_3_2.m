function [aeroForces] = paramSpace_4_2_1_2_1_3_2(sailStates,airStates)

	CL = (4.868083)*sailStates.alpha + (0.146452)*sailStates.beta + (-2.536142)*sailStates.p + (38.936111)*sailStates.q + (2.189824)*sailStates.r + (0.011476)*sailStates.de;
	CD = -0.629570;
	CY = (-0.106005)*sailStates.alpha + (-0.025702)*sailStates.beta + (0.788881)*sailStates.p + (-0.756270)*sailStates.q + (-0.156837)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.673836)*sailStates.alpha + (-0.316390)*sailStates.beta + (-1.189923)*sailStates.p + (11.092448)*sailStates.q + (1.752616)*sailStates.r + (0.000324)*sailStates.de;
	Cm = (-12.936517)*sailStates.alpha + (-0.513998)*sailStates.beta + (7.258256)*sailStates.p + (-133.768066)*sailStates.q + (-7.228554)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (0.140414)*sailStates.alpha + (0.073848)*sailStates.beta + (-1.592646)*sailStates.p + (7.126771)*sailStates.q + (0.014890)*sailStates.r + (0.000360)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end