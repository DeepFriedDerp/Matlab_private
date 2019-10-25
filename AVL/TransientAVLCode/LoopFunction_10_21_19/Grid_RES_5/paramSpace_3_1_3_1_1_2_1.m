function [aeroForces] = paramSpace_3_1_3_1_1_2_1(sailStates,airStates)

	CL = (4.714239)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.944830)*sailStates.p + (26.830347)*sailStates.q + (0.842494)*sailStates.r + (0.009756)*sailStates.de;
	CD = -0.817600;
	CY = (-0.278943)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.614629)*sailStates.p + (-1.304043)*sailStates.q + (0.108329)*sailStates.r + (-0.000275)*sailStates.de;

	Cl = (1.286534)*sailStates.alpha + (-0.255293)*sailStates.beta + (-0.756295)*sailStates.p + (4.885423)*sailStates.q + (0.958031)*sailStates.r + (-0.000257)*sailStates.de;
	Cm = (-16.158777)*sailStates.alpha + (0.000000)*sailStates.beta + (7.755414)*sailStates.p + (-122.917580)*sailStates.q + (-2.739659)*sailStates.r + (-0.067165)*sailStates.de;
	Cn = (1.033623)*sailStates.alpha + (-0.045015)*sailStates.beta + (-1.456062)*sailStates.p + (7.769534)*sailStates.q + (-0.064286)*sailStates.r + (0.000479)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end