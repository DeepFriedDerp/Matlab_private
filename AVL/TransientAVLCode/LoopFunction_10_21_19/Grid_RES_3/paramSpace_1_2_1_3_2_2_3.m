function [aeroForces] = paramSpace_1_2_1_3_2_2_3(sailStates,airStates)

	CL = (3.834391)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.754700)*sailStates.p + (37.430824)*sailStates.q + (-0.982443)*sailStates.r + (0.010771)*sailStates.de;
	CD = 0.083930;
	CY = (-0.005145)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.245530)*sailStates.p + (0.173374)*sailStates.q + (-0.043310)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.304293)*sailStates.alpha + (0.115850)*sailStates.beta + (-1.381597)*sailStates.p + (11.870318)*sailStates.q + (-0.709885)*sailStates.r + (0.000672)*sailStates.de;
	Cm = (-13.584351)*sailStates.alpha + (0.000000)*sailStates.beta + (9.127576)*sailStates.p + (-142.582367)*sailStates.q + (3.333556)*sailStates.r + (-0.069099)*sailStates.de;
	Cn = (0.205141)*sailStates.alpha + (0.020428)*sailStates.beta + (0.324098)*sailStates.p + (-0.669673)*sailStates.q + (-0.025261)*sailStates.r + (-0.000062)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end