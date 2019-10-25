function [aeroForces] = paramSpace_2_2_2_1_3_3_3(sailStates,airStates)

	CL = (5.112632)*sailStates.alpha + (0.120397)*sailStates.beta + (-3.376175)*sailStates.p + (39.579533)*sailStates.q + (1.325059)*sailStates.r + (0.010938)*sailStates.de;
	CD = -1.670330;
	CY = (0.471054)*sailStates.alpha + (-0.025727)*sailStates.beta + (0.657095)*sailStates.p + (1.915492)*sailStates.q + (0.043001)*sailStates.r + (0.000419)*sailStates.de;

	Cl = (1.343582)*sailStates.alpha + (-0.378007)*sailStates.beta + (-1.918045)*sailStates.p + (16.022816)*sailStates.q + (1.380697)*sailStates.r + (0.001535)*sailStates.de;
	Cm = (-13.330837)*sailStates.alpha + (-0.483512)*sailStates.beta + (12.007357)*sailStates.p + (-160.694275)*sailStates.q + (-4.506433)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (-0.961944)*sailStates.alpha + (-0.027041)*sailStates.beta + (-1.657228)*sailStates.p + (6.625283)*sailStates.q + (-0.009784)*sailStates.r + (-0.000378)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end