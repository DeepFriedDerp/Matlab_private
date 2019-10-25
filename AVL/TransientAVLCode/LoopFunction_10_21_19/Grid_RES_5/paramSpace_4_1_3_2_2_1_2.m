function [aeroForces] = paramSpace_4_1_3_2_2_1_2(sailStates,airStates)

	CL = (4.271367)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.762084)*sailStates.p + (38.284306)*sailStates.q + (-1.407985)*sailStates.r + (0.011289)*sailStates.de;
	CD = -0.166280;
	CY = (0.024336)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.487692)*sailStates.p + (0.520429)*sailStates.q + (-0.068522)*sailStates.r + (0.000112)*sailStates.de;

	Cl = (1.457242)*sailStates.alpha + (0.222970)*sailStates.beta + (-1.365488)*sailStates.p + (11.850781)*sailStates.q + (-1.111683)*sailStates.r + (0.000599)*sailStates.de;
	Cm = (-13.861481)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.846724)*sailStates.p + (-141.704483)*sailStates.q + (4.714082)*sailStates.r + (-0.069692)*sailStates.de;
	Cn = (0.099641)*sailStates.alpha + (0.031336)*sailStates.beta + (0.925054)*sailStates.p + (-4.001219)*sailStates.q + (0.000688)*sailStates.r + (-0.000237)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end