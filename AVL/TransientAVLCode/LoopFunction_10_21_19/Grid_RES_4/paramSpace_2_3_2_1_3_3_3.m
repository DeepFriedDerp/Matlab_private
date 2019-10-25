function [aeroForces] = paramSpace_2_3_2_1_3_3_3(sailStates,airStates)

	CL = (5.112632)*sailStates.alpha + (-0.120397)*sailStates.beta + (-3.376175)*sailStates.p + (39.579533)*sailStates.q + (1.325059)*sailStates.r + (0.010938)*sailStates.de;
	CD = -1.670330;
	CY = (0.471054)*sailStates.alpha + (-0.024226)*sailStates.beta + (0.657095)*sailStates.p + (1.915492)*sailStates.q + (0.043001)*sailStates.r + (0.000419)*sailStates.de;

	Cl = (1.302511)*sailStates.alpha + (-0.433310)*sailStates.beta + (-1.885397)*sailStates.p + (15.618943)*sailStates.q + (1.382851)*sailStates.r + (0.001446)*sailStates.de;
	Cm = (-13.330835)*sailStates.alpha + (0.483512)*sailStates.beta + (12.007358)*sailStates.p + (-160.694275)*sailStates.q + (-4.506431)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (-0.929067)*sailStates.alpha + (-0.026136)*sailStates.beta + (-1.655088)*sailStates.p + (6.598812)*sailStates.q + (-0.009643)*sailStates.r + (-0.000378)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end