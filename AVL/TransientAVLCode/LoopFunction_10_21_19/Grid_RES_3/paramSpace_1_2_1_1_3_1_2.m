function [aeroForces] = paramSpace_1_2_1_1_3_1_2(sailStates,airStates)

	CL = (7.812955)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.609700)*sailStates.p + (42.605595)*sailStates.q + (-3.567002)*sailStates.r + (0.012041)*sailStates.de;
	CD = -3.070470;
	CY = (0.254152)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.520655)*sailStates.p + (1.671348)*sailStates.q + (-0.268291)*sailStates.r + (0.000355)*sailStates.de;

	Cl = (3.031386)*sailStates.alpha + (0.693672)*sailStates.beta + (-1.194894)*sailStates.p + (11.832324)*sailStates.q + (-3.074660)*sailStates.r + (0.000236)*sailStates.de;
	Cm = (-12.627441)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.484821)*sailStates.p + (-133.415192)*sailStates.q + (11.862496)*sailStates.r + (-0.068163)*sailStates.de;
	Cn = (-0.458036)*sailStates.alpha + (0.122313)*sailStates.beta + (3.212389)*sailStates.p + (-14.986680)*sailStates.q + (0.061373)*sailStates.r + (-0.000721)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end