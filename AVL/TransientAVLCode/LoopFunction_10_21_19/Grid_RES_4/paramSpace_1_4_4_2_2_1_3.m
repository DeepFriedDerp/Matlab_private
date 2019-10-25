function [aeroForces] = paramSpace_1_4_4_2_2_1_3(sailStates,airStates)

	CL = (4.416138)*sailStates.alpha + (0.431127)*sailStates.beta + (-2.927193)*sailStates.p + (41.845654)*sailStates.q + (-2.143707)*sailStates.r + (0.011514)*sailStates.de;
	CD = -0.485510;
	CY = (-0.082151)*sailStates.alpha + (-0.023922)*sailStates.beta + (-0.714840)*sailStates.p + (0.301044)*sailStates.q + (-0.142158)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.438714)*sailStates.alpha + (0.483660)*sailStates.beta + (-1.450067)*sailStates.p + (13.248065)*sailStates.q + (-1.703433)*sailStates.r + (0.000711)*sailStates.de;
	Cm = (-12.256429)*sailStates.alpha + (-1.515493)*sailStates.beta + (8.707367)*sailStates.p + (-144.677322)*sailStates.q + (7.090597)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (0.398656)*sailStates.alpha + (0.066940)*sailStates.beta + (1.385820)*sailStates.p + (-5.637606)*sailStates.q + (-0.006104)*sailStates.r + (-0.000233)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end