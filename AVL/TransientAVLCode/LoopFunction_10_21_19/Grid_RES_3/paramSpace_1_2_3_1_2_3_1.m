function [aeroForces] = paramSpace_1_2_3_1_2_3_1(sailStates,airStates)

	CL = (5.626956)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.491525)*sailStates.p + (20.882998)*sailStates.q + (1.679826)*sailStates.r + (0.009078)*sailStates.de;
	CD = -2.143090;
	CY = (-0.420695)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.951146)*sailStates.p + (-0.589408)*sailStates.q + (0.167657)*sailStates.r + (-0.000124)*sailStates.de;

	Cl = (1.040941)*sailStates.alpha + (-0.452057)*sailStates.beta + (-0.421995)*sailStates.p + (1.291456)*sailStates.q + (1.762644)*sailStates.r + (-0.000783)*sailStates.de;
	Cm = (-16.481569)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.837409)*sailStates.p + (-111.551048)*sailStates.q + (-5.541865)*sailStates.r + (-0.066175)*sailStates.de;
	Cn = (2.017306)*sailStates.alpha + (-0.079710)*sailStates.beta + (-2.176396)*sailStates.p + (10.132880)*sailStates.q + (-0.060062)*sailStates.r + (0.000317)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end