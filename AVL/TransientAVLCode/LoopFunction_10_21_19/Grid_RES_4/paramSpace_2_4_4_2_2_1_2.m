function [aeroForces] = paramSpace_2_4_4_2_2_1_2(sailStates,airStates)

	CL = (4.525995)*sailStates.alpha + (0.271940)*sailStates.beta + (-2.573828)*sailStates.p + (35.885845)*sailStates.q + (-1.327006)*sailStates.r + (0.011160)*sailStates.de;
	CD = -0.454560;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.529595)*sailStates.p + (-0.000000)*sailStates.q + (-0.034712)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.312590)*sailStates.alpha + (0.348303)*sailStates.beta + (-1.158504)*sailStates.p + (9.425557)*sailStates.q + (-1.132306)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-14.110495)*sailStates.alpha + (-0.969489)*sailStates.beta + (8.470729)*sailStates.p + (-136.150452)*sailStates.q + (4.466996)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.172809)*sailStates.alpha + (0.016095)*sailStates.beta + (1.142024)*sailStates.p + (-5.117507)*sailStates.q + (0.005378)*sailStates.r + (-0.000113)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end