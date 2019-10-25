function [aeroForces] = paramSpace_1_1_1_2_2_1_2(sailStates,airStates)

	CL = (4.050418)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.666468)*sailStates.p + (39.825089)*sailStates.q + (-1.982297)*sailStates.r + (0.010816)*sailStates.de;
	CD = -0.129770;
	CY = (0.022877)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.634013)*sailStates.p + (0.596613)*sailStates.q + (-0.158142)*sailStates.r + (0.000126)*sailStates.de;

	Cl = (1.433869)*sailStates.alpha + (0.293566)*sailStates.beta + (-1.309355)*sailStates.p + (12.280843)*sailStates.q + (-1.544841)*sailStates.r + (0.000561)*sailStates.de;
	Cm = (-11.901958)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.832063)*sailStates.p + (-138.535995)*sailStates.q + (6.569757)*sailStates.r + (-0.066877)*sailStates.de;
	Cn = (0.219214)*sailStates.alpha + (0.073194)*sailStates.beta + (1.143781)*sailStates.p + (-4.333640)*sailStates.q + (-0.018801)*sailStates.r + (-0.000248)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end