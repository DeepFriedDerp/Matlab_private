function [aeroForces] = paramSpace_1_3_1_2_1_1_3(sailStates,airStates)

	CL = (4.120801)*sailStates.alpha + (0.390919)*sailStates.beta + (-2.964697)*sailStates.p + (41.449490)*sailStates.q + (-1.850237)*sailStates.r + (0.011339)*sailStates.de;
	CD = -0.366130;
	CY = (-0.170027)*sailStates.alpha + (-0.026191)*sailStates.beta + (-0.608666)*sailStates.p + (-0.491413)*sailStates.q + (-0.107278)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.227147)*sailStates.alpha + (0.431397)*sailStates.beta + (-1.478747)*sailStates.p + (13.164281)*sailStates.q + (-1.525757)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-11.822835)*sailStates.alpha + (-1.531871)*sailStates.beta + (9.156420)*sailStates.p + (-146.474228)*sailStates.q + (6.218740)*sailStates.r + (-0.068685)*sailStates.de;
	Cn = (0.456299)*sailStates.alpha + (0.058379)*sailStates.beta + (1.154458)*sailStates.p + (-3.862487)*sailStates.q + (-0.019821)*sailStates.r + (0.000048)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end