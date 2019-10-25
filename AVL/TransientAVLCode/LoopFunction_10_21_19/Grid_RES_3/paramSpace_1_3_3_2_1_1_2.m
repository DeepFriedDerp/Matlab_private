function [aeroForces] = paramSpace_1_3_3_2_1_1_2(sailStates,airStates)

	CL = (4.282841)*sailStates.alpha + (0.323676)*sailStates.beta + (-2.575707)*sailStates.p + (38.041496)*sailStates.q + (-1.687271)*sailStates.r + (0.011347)*sailStates.de;
	CD = -0.359920;
	CY = (-0.100843)*sailStates.alpha + (-0.026556)*sailStates.beta + (-0.527064)*sailStates.p + (-0.759372)*sailStates.q + (-0.093008)*sailStates.r + (-0.000161)*sailStates.de;

	Cl = (1.127829)*sailStates.alpha + (0.387894)*sailStates.beta + (-1.159124)*sailStates.p + (10.099493)*sailStates.q + (-1.348973)*sailStates.r + (0.000262)*sailStates.de;
	Cm = (-12.556166)*sailStates.alpha + (-1.157779)*sailStates.beta + (7.907939)*sailStates.p + (-135.573257)*sailStates.q + (5.618810)*sailStates.r + (-0.067548)*sailStates.de;
	Cn = (0.034386)*sailStates.alpha + (0.052204)*sailStates.beta + (1.063829)*sailStates.p + (-3.762247)*sailStates.q + (-0.014323)*sailStates.r + (0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end